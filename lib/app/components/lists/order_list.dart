import 'package:flutter/material.dart';

import '../../core/values/constants.dart';
import '../cards/order_card.dart';

class OrderList extends StatelessWidget {
  const OrderList({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) => OrderCard(),
      separatorBuilder: (context, index) => SizedBox(height: kDefaultMargin),
    );
  }
}
