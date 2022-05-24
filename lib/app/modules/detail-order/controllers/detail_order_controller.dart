import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:zendo_mobile/app/core/utils/snackbar.dart';
import 'package:zendo_mobile/app/core/utils/toast.dart';
import 'package:zendo_mobile/app/core/values/constants.dart';
import 'package:zendo_mobile/app/data/dto/request/update_order_request.dart';
import 'package:zendo_mobile/app/data/models/order.dart';
import 'package:zendo_mobile/app/data/services/db_service.dart';
import 'package:zendo_mobile/app/data/services/order_service.dart';
import 'package:zendo_mobile/app/modules/home/controllers/home_controller.dart';

class DetailOrderController extends GetxController with StateMixin {
  final DbService dbService = Get.find();
  final OrderService orderService = Get.find();
  final HomeController homeController = Get.find();
  final Rx<Order?> data = Rx<Order?>(null);

  void fetchDetailOrder(int id) async {
    change(null, status: RxStatus.loading());
    data.value = await orderService.getDetailOrder(id);
    change(null, status: RxStatus.success());
  }

  Future<void> updateOrder() async {
    if (data.value != null) {
      final UpdateOrderRequest request = UpdateOrderRequest(
        customerName: data.value!.customerName!,
        customerAddress: data.value!.customerAddress!,
        additionalFees: data.value!.additionalFees!,
        deliveryFee: data.value!.deliveryFee!,
        destinations: data.value!.destinations!,
      );

      try {
        await orderService.updateOrder(data.value!.id!, request);
      } catch (e) {
        SnackbarUtil.showError(e.toString().replaceAll('Exception: ', ''));
      }
    }
  }

  void onChangeDestinationFee(int index) {
    final GlobalKey<FormState> feeFormKey = GlobalKey<FormState>();
    final RxString feePrice = ''.obs;

    Get.bottomSheet(
      Wrap(
        children: [
          Container(
            margin: EdgeInsets.all(15).r,
            child: Form(
              key: feeFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: Center(
                      child: Text(
                        "Ubah Biaya",
                        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Divider(thickness: 1),
                  // Field Biaya
                  Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jumlah Biaya",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 7.h),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Masukkan Jumlah Biaya (cth: 15000)',
                          ),
                          onChanged: (value) => feePrice.value = value,
                          validator: Validators.compose([
                            Validators.required("Jumlah Biaya tidak boleh kosong"),
                            Validators.min(1000, "Jumlah Biaya minimal Rp. 1000"),
                            Validators.max(1000000, "Jumlah Ongkos maksimal Rp. 1000000"),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 7.h),
                  // Submit Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () async {
                      if (feeFormKey.currentState!.validate()) {
                        feeFormKey.currentState!.save();

                        data.value!.destinations![index].expenses = int.parse(feePrice.value);

                        await updateOrder();
                        Get.back();
                        fetchDetailOrder(data.value!.id!);
                        homeController.fetchOngoingOrders();
                        ToastUtil.showDefault("Biaya tujuan berhasil diubah");
                      }
                    },
                    child: Text(
                      "Simpan Ongkos",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  void onCancelPress() {
    Get.defaultDialog(
      title: "Batalkan Pesanan",
      content: Text("Apakah anda yakin ingin membatalkan pesanan ini?"),
      textConfirm: "Ya",
      textCancel: "Tidak",
      onConfirm: () async {
        try {
          await orderService.cancelOrder(data.value!.id!);
          homeController.fetchOngoingOrders();
          Get.back();
          Timer(Duration(milliseconds: 400), () => Get.back());
          ToastUtil.showDefault("Pesanan berhasil dibatalkan");
        } catch (e) {
          SnackbarUtil.showError(e.toString().replaceAll('Exception: ', ''));
        }
      },
    );
  }

  void onCompletePress() {
    Get.defaultDialog(
      title: "Selesai Pesanan",
      content: Text("Apakah anda yakin ingin menyelesaikan pesanan ini?"),
      textConfirm: "Ya",
      textCancel: "Tidak",
      onConfirm: () async {
        try {
          await orderService.completeOrder(data.value!.id!);
          homeController.fetchOngoingOrders();
          Get.back();
          Timer(Duration(milliseconds: 400), () => Get.back());
          ToastUtil.showDefault("Pesanan telah selesai");
        } catch (e) {
          SnackbarUtil.showError(e.toString().replaceAll('Exception: ', ''));
        }
      },
    );
  }

  void downloadInvoice() async {
    // validate if order is exist
    if (data.value == null) {
      SnackbarUtil.showError("Pesanan tidak ditemukan");
      return;
    }

    // validate if application has permission to write to external storage
    if (!(await Permission.manageExternalStorage.isGranted)) {
      if (await Permission.manageExternalStorage.request().isGranted) {
        downloadInvoice();
      } else {
        SnackbarUtil.showError("Anda tidak memiliki izin untuk mengakses penyimpanan");
      }
      return;
    }

    // get the invoice
    final token = dbService.getAuthToken()!;
    final dio = Dio();

    final appStorage = (await getExternalStorageDirectories(type: StorageDirectory.downloads))!.first;
    final file = File('${appStorage.path}/zendo-invoice-${data.value!.id}.pdf');

    final response = await dio.post(
      '$apiBaseUrl/order/${data.value!.id}/invoice-download',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
        responseType: ResponseType.bytes,
        followRedirects: false,
      ),
    );

    if (response.statusCode != HttpStatus.ok) {
      SnackbarUtil.showError("Gagal mengambil invoice");
      return;
    }

    // save invoice to external storage
    try {
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      SnackbarUtil.showDownload(file);
    } catch (e) {
      SnackbarUtil.showError("Gagal meyimpan invoice");
      return;
    }
  }

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments is int) {
      fetchDetailOrder(Get.arguments as int);
    } else {
      Get.back();
    }
  }
}
