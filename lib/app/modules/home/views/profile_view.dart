import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zendo_mobile/app/modules/home/controllers/home_controller.dart';

class ProfileView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(32, 20, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 56,
                  width: 56,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Achmad Fahreza",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500)),
                      Text("+62983232322",
                          style: TextStyle(
                            fontSize: 14,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 32, bottom: 6),
              child: Text(
                "Hasil anda hari ini :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              )),
          Container(
            height: 72,
            decoration: BoxDecoration(color: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "5",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Text(
                      "Order",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "15.000",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Text(
                      "Omzet",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "12.000",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.green),
                    ),
                    Text(
                      "Untuk Driver",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "3.000",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.yellow),
                    ),
                    Text(
                      "Setoran",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, top: 28),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.history,
                      size: 22,
                      color: Colors.grey,
                    )),
                Text(
                  "Riwayat Order",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Divider(thickness: 2)),
          Container(
            margin: EdgeInsets.only(left: 15, top: 16),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.headphones,
                      size: 22,
                      color: Colors.grey,
                    )),
                Text(
                  "Hubungi Admin",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Divider(thickness: 2)),
          Container(
            margin: EdgeInsets.only(left: 15, top: 16),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.logout,
                      size: 22,
                      color: Colors.grey,
                    )),
                Text(
                  "Keluar",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Divider(thickness: 2)),
        ],
      ),
    );
  }
}
