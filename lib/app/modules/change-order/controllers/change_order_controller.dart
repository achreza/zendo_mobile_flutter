import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:zendo_mobile/app/core/utils/snackbar.dart';
import 'package:zendo_mobile/app/core/utils/toast.dart';
import 'package:zendo_mobile/app/data/dto/request/update_order_request.dart';
import 'package:zendo_mobile/app/modules/home/controllers/home_controller.dart';

import '../../../data/models/order.dart';
import '../../../data/services/order_service.dart';

class ChangeOrderController extends GetxController with StateMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxBool isSubmit = false.obs;
  final OrderService orderService = Get.find();
  final HomeController homeController = Get.find();
  final Rx<Order?> data = Rx<Order?>(null);

  void fetchDetailOrder(int id) async {
    change(null, status: RxStatus.loading());
    data.value = await orderService.getDetailOrder(id);
    change(null, status: RxStatus.success());
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

  void onAddFeePress() {
    final GlobalKey<FormState> feeFormKey = GlobalKey<FormState>();
    final RxString feeName = ''.obs;
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
                        "Tambah Ongkos",
                        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Divider(thickness: 1),
                  // Nama Ongkos
                  Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama Ongkos",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 7.h),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Masukkan Nama Ongkos',
                          ),
                          onChanged: (value) => feeName.value = value,
                          validator: Validators.compose([
                            Validators.required("Nama Ongkos tidak boleh kosong"),
                            Validators.maxLength(30, "Nama Ongkos maksimal 30 karakter"),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  // Jumlah Ongkos
                  Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jumlah Ongkos",
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
                            hintText: 'Masukkan Jumlah Ongkos (cth: 15000)',
                          ),
                          onChanged: (value) => feePrice.value = value,
                          validator: Validators.compose([
                            Validators.required("Jumlah Ongkos tidak boleh kosong"),
                            Validators.min(1000, "Jumlah Ongkos minimal Rp. 1000"),
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
                    onPressed: () {
                      if (feeFormKey.currentState!.validate()) {
                        feeFormKey.currentState!.save();
                        data.value!.additionalFees?.add(AdditionalFee(
                          note: feeName.value,
                          expenses: int.parse(feePrice.value),
                        ));
                        Get.back();
                        data.refresh();
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

  void onDestinationPress() {
    final GlobalKey<FormState> destinationFormKey = GlobalKey<FormState>();
    final RxString destinationName = ''.obs;
    final RxString destinationNote = ''.obs;

    Get.bottomSheet(
      Wrap(
        children: [
          Container(
            margin: EdgeInsets.all(15).r,
            child: Form(
              key: destinationFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: Center(
                      child: Text(
                        "Tambah Tujuan",
                        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Divider(thickness: 1),
                  // Nama Tujuan
                  Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama Tujuan",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 7.h),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Masukkan Nama Tujuan',
                          ),
                          onChanged: (value) => destinationName.value = value,
                          validator: Validators.compose([
                            Validators.required("Nama Tujuan tidak boleh kosong"),
                            Validators.maxLength(30, "Nama Tujuan maksimal 30 karakter"),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  // Deskripsi Tujuan
                  Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deskripsi Tujuan",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 7.h),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Masukkan Deskripsi Tujuan (cth: Beli Popok)',
                          ),
                          onChanged: (value) => destinationNote.value = value,
                          validator: Validators.compose([
                            Validators.required("Deskripsi Tujuan tidak boleh kosong"),
                            Validators.maxLength(40, "Deskripsi Tujuan maksimal 40 karakter"),
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
                    onPressed: () {
                      if (destinationFormKey.currentState!.validate()) {
                        destinationFormKey.currentState!.save();
                        data.value!.destinations?.add(Destination(
                          name: destinationName.value,
                          note: destinationNote.value,
                          expenses: 0,
                        ));
                        data.refresh();
                        Get.back();
                      }
                    },
                    child: Text(
                      "Simpan Tujuan",
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

  void onDeleteDestinationIndex(int index) {
    data.value!.destinations!.removeAt(index);
    data.refresh();
  }

  void onDeleteFeeIndex(int index) {
    data.value!.additionalFees!.removeAt(index);
    data.refresh();
  }

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      isSubmit.value = true;

      if (data.value!.destinations!.isEmpty) {
        SnackbarUtil.showError('Minimal harus memiliki 1 tujuan order');

        isSubmit.value = false;
        return;
      }

      final dto = UpdateOrderRequest(
        additionalFees: data.value!.additionalFees!.toList(),
        destinations: data.value!.destinations!.toList(),
        customerAddress: data.value!.customerAddress!,
        customerName: data.value!.customerName!,
        deliveryFee: data.value!.deliveryFee!,
      );

      final id = data.value!.id!;

      try {
        await orderService.updateOrder(id, dto);
        homeController.fetchOngoingOrders();
        Get.offNamedUntil('/home', ModalRoute.withName('/home'));
        ToastUtil.showDefault('Order berhasil diubah');
      } catch (e) {
        SnackbarUtil.showError(e.toString().replaceAll('Exception: ', ''));
      } finally {
        isSubmit.value = false;
      }
    }
  }
}
