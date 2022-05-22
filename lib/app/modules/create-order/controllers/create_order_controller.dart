import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:zendo_mobile/app/core/utils/snackbar.dart';
import 'package:zendo_mobile/app/data/dto/request/create_order_request.dart';
import 'package:zendo_mobile/app/data/models/order.dart';
import 'package:zendo_mobile/app/data/services/order_service.dart';
import 'package:zendo_mobile/app/modules/home/controllers/home_controller.dart';

class CreateOrderController extends GetxController {
  final OrderService orderService = Get.find();
  final HomeController homeController = Get.find();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxBool isSubmit = false.obs;

  final RxString customerName = ''.obs;
  final RxString customerAddress = ''.obs;
  final RxString deliveryFee = ''.obs;
  final RxList<Destination> destinations = RxList();
  final RxList<AdditionalFee> additionalFees = RxList();

  void onDeleteDestinationIndex(int index) {
    destinations.removeAt(index);
  }

  void onDeleteFeeIndex(int index) {
    additionalFees.removeAt(index);
  }

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      isSubmit.value = true;

      if (destinations.isEmpty) {
        SnackbarUtil.showError('Minimal harus memiliki 1 tujuan order');

        isSubmit.value = false;
        return;
      }

      final dto = CreateOrderRequest(
        additionalFees: additionalFees.toList(),
        destinations: destinations.toList(),
        customerAddress: customerAddress.value,
        customerName: customerName.value,
        deliveryFee: int.parse(deliveryFee.value),
      );

      try {
        await orderService.createOrder(dto);
        Get.back();
        homeController.fetchOngoingOrders();
      } catch (e) {
        log(e.toString());
        SnackbarUtil.showError(e.toString().replaceAll('Exception: ', ''));
      } finally {
        isSubmit.value = false;
      }
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
                        additionalFees.add(AdditionalFee(
                          note: feeName.value,
                          expenses: int.parse(feePrice.value),
                        ));
                        Get.back();
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
                        destinations.add(Destination(
                          name: destinationName.value,
                          note: destinationNote.value,
                          expenses: 0,
                        ));
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
}
