// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_credential.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserCredentialAdapter extends TypeAdapter<UserCredential> {
  @override
  final int typeId = 1;

  @override
  UserCredential read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCredential(
      phoneNumber: fields[0] as String,
      token: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserCredential obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.phoneNumber)
      ..writeByte(1)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCredentialAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
