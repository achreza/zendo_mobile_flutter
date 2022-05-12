import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/detail_order_controller.dart';

class DetailOrderCompleteView extends GetView<DetailOrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Detail Order"),
        centerTitle: true,
      ),
      body: Container(
          margin: EdgeInsets.only(left: 16, top: 11, right: 16, bottom: 20).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Info Pesanan", style: TextStyle(fontSize: 14.sp)),
                      Text("INV-2821821122121",
                          style: TextStyle(fontSize: 12.sp))
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Selesai",
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Senin, 20 Maret 2040 - 09.00 Wib",
                        style: TextStyle(fontSize: 12.sp),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Text("Info Pelanggan", style: TextStyle(fontSize: 14.sp)),
                  SizedBox(
                    height: 6,
                  ),
                  Text("Pak Ambatukam",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 4,
                  ),
                  Text("Peurimas V.26, Botoran, Tulungagung",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    "Tujuan Order",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                  ),
                  //Tiap Tujuan Order
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10).r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Icon(
                                        Icons.location_pin,
                                        size: 30.w,
                                      )),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Indomaret Sembung",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.notes,
                                            size: 18.w,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Text(
                                            "Beli Popok",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Rp 20.000",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 35.w,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin:
                              EdgeInsets.only(left: 40, right: 10, top: 4).r,
                          child: Divider(
                            thickness: 1,
                          )),
                    ],
                  ),
                  //Tujuan Order 2
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10).r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(right: 10).r,
                                      child: Icon(
                                        Icons.location_pin,
                                        size: 30.w,
                                      )),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Pasar Ngemplak",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.notes,
                                            size: 18.w,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Text(
                                            "Beli Bawang",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Rp 5.000",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 35.w,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin:
                              EdgeInsets.only(left: 40, right: 10, top: 4).r,
                          child: Divider(
                            thickness: 1,
                          )),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10).r,
                      child: Divider(
                        thickness: 2,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ongkos Pengeluaran",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      Text(
                        "Rp. 25.000",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ongkos Kirim",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      Text(
                        "Rp. 15.000",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Ongkos Lain Lain",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  //Tiap Ongkos Lain lain
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 20).r,
                          child: Text(
                            "Parkir",
                            style: TextStyle(fontSize: 15.sp),
                          )),
                      Text(
                        "Rp. 15.000",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Rp. 15.000",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        minimumSize: const Size.fromHeight(42),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Hubungi Admin",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ],
          )),
    );
  }
}
