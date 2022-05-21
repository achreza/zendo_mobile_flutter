// ignore_for_file: non_constant_identifier_names

import 'package:zendo_mobile/app/data/models/order.dart';

class UpdateOrderRequest {
  final int deliveryFee;
  final List<Destination> destinations;
  final List<AdditionalFee> additionalFees;
  final String customerName;
  final String customerAddress;

  UpdateOrderRequest({
    required this.deliveryFee,
    required this.destinations,
    required this.additionalFees,
    required this.customerName,
    required this.customerAddress,
  });

  Map<String, dynamic> toJson() => {
        'delivery_fee': deliveryFee,
        'destinations': destinations.map((e) => e.toJson()).toList(),
        'additional_fees': additionalFees.map((e) => e.toJson()).toList(),
        'customer_name': customerName,
        'customer_address': customerAddress,
      };
}
