import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:zendo_mobile/app/core/values/constants.dart';

import '../controllers/create_order_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateOrderView extends GetView<CreateOrderController> {
  final inputSpace = 7.h;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Order'),
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
                Text(
                  'Buat Order',
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
                        onPressed: () {},
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
                      ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: kDefaultMargin,
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {},
                              ),
                              title: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Cancel Fee',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.moneyBill1Wave,
                                          size: 17.w,
                                        ),
                                        SizedBox(width: 10.w),
                                        Text(
                                          'Rp. 5.000',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
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
                        onPressed: () {},
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_circle),
                              SizedBox(width: 10.w),
                              Text('Tambah Tujuan'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: inputSpace),
                      ListView(
                        shrinkWrap: true,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: kDefaultMargin),
                            leading: Icon(Icons.location_on),
                            trailing: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {},
                            ),
                            title: Text('Indomaret Sembung'),
                            subtitle: Text('Beli Bawang'),
                          ),
                        ],
                      ),
                    ],
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
