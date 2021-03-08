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
      name: fields[0] as String,
      email: fields[1] as String,
      dob: fields[4] as DateTime,
      image: fields[5] as String,
      phone: fields[3] as String,
      role: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ModelUser obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.role)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.dob)
      ..writeByte(5)
      ..write(obj.image);
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
