import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_order_controller.dart';

class DetailOrderView extends GetView<DetailOrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Detail Order"),
        centerTitle: true,
      ),
      body: Container(
          margin: EdgeInsets.only(left: 16, top: 11, right: 16, bottom: 20),
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
                      Text("Info Pesanan", style: TextStyle(fontSize: 14)),
                      Text("INV-2821821122121", style: TextStyle(fontSize: 12))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dalam Proses",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Senin, 20 Maret 2040 - 09.00 Wib",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Text("Info Pelanggan", style: TextStyle(fontSize: 14)),
                  SizedBox(
                    height: 6,
                  ),
                  Text("Pak Ambatukam",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 4,
                  ),
                  Text("Peurimas V.26, Botoran, Tulungagung",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Tujuan Order",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  //Tiap Tujuan Order
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
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
                                        size: 30,
                                      )),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Indomaret Sembung",
                                        style: TextStyle(
                                            fontSize: 14,
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
                                            size: 18,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            "Beli Popok",
                                            style: TextStyle(
                                                fontSize: 12,
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
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet<void>(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                              height: 210,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  25),
                                                          topRight:
                                                              Radius.circular(
                                                                  25))),
                                              child: Container(
                                                margin: EdgeInsets.all(15),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Center(
                                                            child: Text(
                                                          "Tambah Biaya",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                        Divider(
                                                          thickness: 1,
                                                        ),
                                                        Text(
                                                          "Tambah Biaya",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 4),
                                                          height: 40,
                                                          child: TextField(
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              labelText:
                                                                  'Masukkan Jumlah Biaya (cth: 15000)',
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary: Colors.red,
                                                          minimumSize: const Size
                                                              .fromHeight(42),
                                                        ),
                                                        onPressed: () {},
                                                        child: Text(
                                                          "Simpan Tujuan",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                  ],
                                                ),
                                              ));
                                        },
                                      );
                                    },
                                    child: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 35,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 40, right: 10, top: 4),
                          child: Divider(
                            thickness: 1,
                          )),
                    ],
                  ),
                  //Tujuan Order 2
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
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
                                        size: 30,
                                      )),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Pasar Ngemplak",
                                        style: TextStyle(
                                            fontSize: 14,
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
                                            size: 18,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            "Beli Bawang",
                                            style: TextStyle(
                                                fontSize: 12,
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
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 35,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 40, right: 10, top: 4),
                          child: Divider(
                            thickness: 1,
                          )),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Divider(
                        thickness: 2,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ongkos Pengeluaran",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "Rp. 25.000",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ongkos Kirim",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "Rp. 15.000",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Ongkos Lain Lain",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //Tiap Ongkos Lain lain
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "Parkir",
                            style: TextStyle(fontSize: 15),
                          )),
                      Text(
                        "Rp. 15.000",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Rp. 15.000",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
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
                        side: BorderSide(
                          width: 2.0,
                          color: Colors.red,
                        ),
                        primary: Colors.white,
                        minimumSize: const Size.fromHeight(42),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Ubah Order",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )),
                  Row(children: <Widget>[
                    Expanded(
                      flex: 9,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red.withOpacity(0.25),
                            minimumSize: const Size.fromHeight(42),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Batal",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 21,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            minimumSize: const Size.fromHeight(42),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Selesai",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ])
                ],
              ),
            ],
          )),
    );
  }
}
