// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelUser.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelUserAdapter extends TypeAdapter<ModelUser> {
  @override
  final int typeId = 4;

  @override
  ModelUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelUser(
      id: fields[0] as int,
      name: fields[1] as String,
      email: fields[2] as String,
      dob: fields[5] as DateTime,
      image: fields[6] as String,
      phone: fields[4] as String,
      role: fields[3] as RoleEnum,
      vetId: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ModelUser obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.role)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.dob)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.vetId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
