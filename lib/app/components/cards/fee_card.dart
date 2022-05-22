import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zendo_mobile/app/core/utils/text.dart';
import 'package:zendo_mobile/app/data/models/order.dart';

import '../../core/values/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeeCard extends StatelessWidget {
  const FeeCard({
    Key? key,
    required this.data,
    this.onDelete,
  }) : super(key: key);

  final AdditionalFee data;
  final Function? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          onPressed: () {
            onDelete?.call();
          },
        ),
        title: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.note!,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 5.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.moneyBill1Wave,
                    size: 17.w,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    TextUtil.toRupiah(data.expenses!),
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
    );
  }
}
