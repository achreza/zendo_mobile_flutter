import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:zendo_mobile/app/core/utils/share.dart';
import 'package:zendo_mobile/app/core/utils/text.dart';
import 'package:zendo_mobile/app/core/values/constants.dart';

import '../controllers/detail_order_controller.dart';

class DetailOrderView extends GetView<DetailOrderController> {
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Order"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.ios_share),
            onPressed: () => controller.downloadInvoice(),
          ),
        ],
      ),
      body: controller.obx(
        (_) => Container(
          margin: EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 2,
            vertical: kDefaultPadding * 3,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Contents
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _TitleSection(),
                      _CustomerInfoSection(),
                      _ListDestinationSection(),
                      _DefaultCostSection(),
                      _AdditionalCostSection(),
                    ],
                  ),
                ),
              ),
              // Buttons
              Obx(
                () => controller.data.value!.status == "on-going"
                    ? _OngoingOrderState()
                    : _CompleteOrderState(),
              ),
            ],
          ),
        ),
        onLoading: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _CompleteOrderState extends StatelessWidget {
  const _CompleteOrderState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            minimumSize: const Size.fromHeight(45),
          ),
          onPressed: () => ShareUtil.contactAdmin(),
          child: Text("Hubungi Admin"),
        ),
      ],
    );
  }
}

class _OngoingOrderState extends StatelessWidget {
  _OngoingOrderState({
    Key? key,
  }) : super(key: key);

  final DetailOrderController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              side: BorderSide(
                width: 2.0.w,
                color: Colors.red,
              ),
              primary: Colors.white,
              minimumSize: const Size.fromHeight(45),
            ),
            onPressed: () => Get.toNamed("/change-order", arguments: _controller.data.value!.id),
            child: Text(
              "Ubah Order",
              style: TextStyle(color: Colors.red, fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 15.h),
          Row(
            children: <Widget>[
              Expanded(
                flex: 9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red.shade100,
                    minimumSize: const Size.fromHeight(45),
                  ),
                  onPressed: () => _controller.onCancelPress(),
                  child: Text(
                    "Batal",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 21,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    minimumSize: const Size.fromHeight(45),
                  ),
                  onPressed: () => _controller.onCompletePress(),
                  child: Text(
                    "Selesai",
                    style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _AdditionalCostSection extends StatelessWidget {
  _AdditionalCostSection({
    Key? key,
  }) : super(key: key);

  final DetailOrderController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          Text("Ongkos Lain Lain", style: TextStyle(fontSize: 15.sp)),
          SizedBox(height: 5.h),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _controller.data.value?.additionalFees?.length,
            itemBuilder: (ctx, idx) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: kDefaultPadding * 2),
                  child: Text(
                    _controller.data.value!.additionalFees![idx].note!,
                    style: TextStyle(fontSize: 15.sp),
                  ),
                ),
                Text(
                  TextUtil.toRupiah(
                    _controller.data.value!.additionalFees![idx].expenses!,
                  ),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                TextUtil.toRupiah(_controller.data.value!.totalFee!),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _DefaultCostSection extends StatelessWidget {
  _DefaultCostSection({
    Key? key,
  }) : super(key: key);

  final DetailOrderController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Ongkos Pengeluaran", style: TextStyle(fontSize: 15.sp)),
              Text(
                TextUtil.toRupiah(
                  _controller.data.value!.destinations!
                      .map<int>((e) => e.expenses!)
                      .reduce((value, element) => value + element),
                ),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ongkos Kirim",
                style: TextStyle(fontSize: 15.sp),
              ),
              Text(
                TextUtil.toRupiah(_controller.data.value!.deliveryFee!),
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _ListDestinationSection extends StatelessWidget {
  _ListDestinationSection({
    Key? key,
  }) : super(key: key);

  final DetailOrderController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6.h),
          Text(
            "Tujuan Order",
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _controller.data.value!.destinations!.length,
            itemBuilder: (ctx, idx) => ListTile(
              onTap: _controller.data.value!.status == 'on-going'
                  ? () => _controller.onChangeDestinationFee(idx)
                  : null,
              contentPadding: EdgeInsets.zero,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5.h),
                    child: Image.asset(
                      'assets/icons/map_marker.png',
                      width: 22.w,
                    ),
                  ),
                  SizedBox(width: 9.w),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5.h),
                                Text(
                                  _controller.data.value!.destinations![idx].name!,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Row(
                                  children: [
                                    Icon(Icons.list_alt, size: 10.w),
                                    SizedBox(width: 5.w),
                                    Text(
                                      _controller.data.value!.destinations![idx].note!,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Obx(
                                () => Text(
                                  TextUtil.toRupiah(_controller.data.value!.destinations![idx].expenses!),
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              _controller.data.value!.status == 'on-going'
                                  ? Icon(Icons.chevron_right)
                                  : Container(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Divider(thickness: 1),
        ],
      ),
    );
  }
}

class _CustomerInfoSection extends StatelessWidget {
  _CustomerInfoSection({
    Key? key,
  }) : super(key: key);

  final DetailOrderController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Info Pelanggan",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            _controller.data.value!.customerName!,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            _controller.data.value!.customerAddress!,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10.h),
          Divider(thickness: 1),
        ],
      ),
    );
  }
}

class _TitleSection extends StatelessWidget {
  _TitleSection({
    Key? key,
  }) : super(key: key);

  final DetailOrderController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Info Pesanan",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade900,
                ),
              ),
              Text(
                "#${_controller.data.value!.id}",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade700,
                ),
              )
            ],
          ),
          SizedBox(height: 3.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _controller.data.value!.status == "on-going"
                    ? "Dalam Proses"
                    : _controller.data.value!.status == "cancel"
                        ? "Dibatalkan"
                        : "Selesai",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                TextUtil.formatDate(DateTime.parse(_controller.data.value!.createdAt!)) + " WIB",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade700,
                ),
              )
            ],
          ),
          Divider(thickness: 1),
        ],
      ),
    );
  }
}
