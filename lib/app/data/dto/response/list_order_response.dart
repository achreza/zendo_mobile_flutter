import '../../models/order.dart';

class ListOrderResponse {
  final bool success;
  final String message;
  final List<Order> data;

  ListOrderResponse({
    required this.success, 
    required this.message, 
    required this.data
  });

  factory ListOrderResponse.fromJson(Map<String, dynamic> json) {
    return ListOrderResponse(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List<dynamic>).map((e) => Order.fromJson(e)).toList()
    );
  }
  
}
