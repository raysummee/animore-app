// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelImportantEvent.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelImportantEventAdapter extends TypeAdapter<ModelImportantEvent> {
  @override
  final int typeId = 5;

  @override
  ModelImportantEvent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelImportantEvent(
      dateTime: fields[2] as DateTime,
      id: fields[0] as int,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ModelImportantEvent obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelImportantEventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
