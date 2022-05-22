import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zendo_mobile/app/data/models/order.dart';

class DestinationCard extends StatelessWidget {
  const DestinationCard({
    Key? key,
    required this.data,
    this.onDelete,
  }) : super(key: key);

  final Destination data;
  final Function? onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      trailing: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          onDelete?.call();
        },
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FaIcon(FontAwesomeIcons.mapLocation, size: 17.w),
          SizedBox(width: 10.w),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    data.name!,
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
                        data.note!,
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
          ),
        ],
      ),
    );
  }
}
