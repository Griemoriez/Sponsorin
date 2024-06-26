// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as int,
      role: fields[1] as String,
      picture: fields[2] as String?,
      name: fields[3] as String,
      password: fields[4] as String,
      company: fields[5] as String,
      email: fields[6] as String,
      phone: fields[7] as String?,
      website: fields[8] as String?,
      brief: fields[9] as String?,
      about: fields[10] as String?,
      address: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.role)
      ..writeByte(2)
      ..write(obj.picture)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.company)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.website)
      ..writeByte(9)
      ..write(obj.brief)
      ..writeByte(10)
      ..write(obj.about)
      ..writeByte(11)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
