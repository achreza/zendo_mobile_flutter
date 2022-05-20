import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../components/cards/destination_card.dart';
import '../../../components/cards/fee_card.dart';
import '../../../core/values/constants.dart';
import '../controllers/change_order_controller.dart';

class ChangeOrderView extends GetView<ChangeOrderController> {
  final inputSpace = 7.h;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubah Order'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        // itemBuilder: (context, index) => FeeCard(),
                        itemBuilder: (context, index) => Container(),
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
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        // itemBuilder: (context, index) => DestinationCard(),
                        itemBuilder: (context, index) => Container(),
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
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
