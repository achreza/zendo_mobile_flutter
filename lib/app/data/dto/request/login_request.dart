// ignore_for_file: non_constant_identifier_names

class LoginRequest {
  final String phone_number;
  final String password;

  LoginRequest({
    required this.phone_number,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'phone_number': phone_number,
        'password': password,
      };
}
