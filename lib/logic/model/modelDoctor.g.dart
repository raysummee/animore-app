// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelDoctor.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelDoctorAdapter extends TypeAdapter<ModelDoctor> {
  @override
  final int typeId = 6;

  @override
  ModelDoctor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelDoctor(
      id: fields[0] as int,
      name: fields[1] as String,
      star: fields[5] as int,
      location: fields[6] as String,
      desc: fields[4] as String,
      available: fields[3] as bool,
      email: fields[2] as String,
      status: fields[7] as BookStatusEnum,
    );
  }

  @override
  void write(BinaryWriter writer, ModelDoctor obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.available)
      ..writeByte(4)
      ..write(obj.desc)
      ..writeByte(5)
      ..write(obj.star)
      ..writeByte(6)
      ..write(obj.location)
      ..writeByte(7)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelDoctorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
