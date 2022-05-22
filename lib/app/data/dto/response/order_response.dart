import '../../models/order.dart';

class OrderResponse {
  final bool success;
  final String message;
  final Order data;

  OrderResponse({
    required this.success, 
    required this.message, 
    required this.data
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      success: json['success'],
      message: json['message'],
      data: Order.fromJson(json['data'])
    );
  }
  
}
