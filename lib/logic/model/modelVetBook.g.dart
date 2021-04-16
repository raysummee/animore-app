// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelVetBook.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelVetBookAdapter extends TypeAdapter<ModelVetBook> {
  @override
  final int typeId = 9;

  @override
  ModelVetBook read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelVetBook(
      id: fields[0] as int,
      user: fields[2] as ModelUser,
      pet: fields[3] as ModelPet,
      onDate: fields[1] as DateTime,
      status: fields[4] as BookStatusEnum,
      subject: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ModelVetBook obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.onDate)
      ..writeByte(2)
      ..write(obj.user)
      ..writeByte(3)
      ..write(obj.pet)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.subject);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelVetBookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
