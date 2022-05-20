import 'package:hive/hive.dart';

part 'user_credential.g.dart';

@HiveType(typeId: 1)
class UserCredential {
  @HiveField(0)
  final String phoneNumber;

  @HiveField(1)
  final String token;

  const UserCredential({
    required this.phoneNumber,
    required this.token,
  });
}
