import 'package:flutter/material.dart';
import 'package:zendo_mobile/app/data/models/order.dart';

import '../../core/values/constants.dart';
import '../cards/order_card.dart';

class OrderList extends StatelessWidget {
  const OrderList({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Order> data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: kDefaultMargin * 2),
      itemCount: data.length,
      reverse: true,
      itemBuilder: (context, index) => OrderCard(data: data[index]),
      separatorBuilder: (context, index) => SizedBox(height: kDefaultMargin),
    );
  }
}
