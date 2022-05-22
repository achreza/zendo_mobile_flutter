import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import '../../../components/cards/destination_card.dart';
import '../../../components/cards/fee_card.dart';
import '../../../core/values/constants.dart';
import '../controllers/change_order_controller.dart';

class ChangeOrderView extends GetView<ChangeOrderController> {
  final inputSpace = 7.h;

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubah Order'),
        centerTitle: true,
      ),
      body: controller.obx(
        (_) => SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultMargin * 2,
                vertical: kDefaultMargin * 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    'Ubah Order',
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // Field: Nama Pelanggan
                  Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama Pelanggan",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: inputSpace),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Masukkan Nama Pelanggan',
                          ),
                          initialValue: controller.data.value!.customerName,
                          onChanged: (value) => controller.data.value!.customerName = value,
                          validator: Validators.compose([
                            Validators.required("Nama Pelanggan tidak boleh kosong"),
                            Validators.maxLength(30, "Nama Pelanggan maksimal 30 karakter"),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  // Field: Alamat Pelanggan
                  Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Alamat Pelanggan",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: inputSpace),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Masukkan Alamat Pelanggan',
                          ),
                          initialValue: controller.data.value!.customerAddress,
                          onChanged: (value) => controller.data.value!.customerAddress = value,
                          validator: Validators.compose([
                            Validators.required("Alamat Pelanggan tidak boleh kosong"),
                            Validators.maxLength(60, "Alamat Pelanggan maksimal 60 karakter"),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  // Field: Ongkos Kirim
                  Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ongkos Kirim",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: inputSpace),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Masukkan Ongkos Kirim',
                          ),
                          initialValue: controller.data.value!.deliveryFee.toString(),
                          onChanged: (value) => controller.data.value!.deliveryFee = int.tryParse(value),
                          validator: Validators.compose([
                            Validators.required("Ongkos Kirim tidak boleh kosong"),
                            Validators.min(2000, "Ongkos Kirim minimal Rp. 2.000"),
                            Validators.max(1000000, "Ongkos Kirim maksimal Rp. 1.000.000"),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  // Field: Ongkos Lain-Lain
                  Container(
                    margin: EdgeInsets.only(bottom: 30.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ongkos Lain - Lain",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: inputSpace),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.grey.shade300),
                          ),
                          onPressed: controller.onAddFeePress,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_circle),
                                SizedBox(width: 10.w),
                                Text('Tambah Ongkos'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: inputSpace),
                        Obx(
                          () => ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.data.value!.additionalFees!.length,
                            itemBuilder: (context, index) => FeeCard(
                                data: controller.data.value!.additionalFees![index],
                                onDelete: () => controller.onDeleteFeeIndex(index)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Field: Tujuan Order
                  Container(
                    margin: EdgeInsets.only(bottom: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tujuan Order",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: inputSpace),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.grey.shade300),
                          ),
                          onPressed: controller.onDestinationPress,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.add_circle),
                                SizedBox(width: 10.w),
                                Text('Tambah Tujuan'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: inputSpace),
                        Obx(
                          () => ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.data.value!.destinations!.length,
                            itemBuilder: (context, index) => DestinationCard(
                              data: controller.data.value!.destinations![index],
                              onDelete: () => controller.onDeleteDestinationIndex(index),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Submit Button
                  Container(
                    height: 50.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text('Simpan Order'),
                      onPressed: controller.isSubmit.isFalse ? controller.onSubmit : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onLoading: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
