// ignore_for_file: non_constant_identifier_names

class LoginResponse {
  final bool success;
  final String message;
  final LoginResponseData data;

  LoginResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json['success'] as bool,
        message: json['message'] as String,
        data: LoginResponseData.fromJson(json['data'] as Map<String, dynamic>),
      );
}

class LoginResponseData {
  final String phone_number;
  final String token;

  LoginResponseData({
    required this.phone_number,
    required this.token,
  });

  factory LoginResponseData.fromJson(Map<String, dynamic> json) =>
      LoginResponseData(
        phone_number: json['phone_number'] as String,
        token: json['token'] as String,
      );
}
