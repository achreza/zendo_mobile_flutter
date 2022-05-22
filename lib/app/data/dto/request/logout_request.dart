// ignore_for_file: non_constant_identifier_names

class LogoutRequest {
  final String token;

  LogoutRequest({required this.token});

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}
