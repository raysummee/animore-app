// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelMessage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelMessageAdapter extends TypeAdapter<ModelMessage> {
  @override
  final int typeId = 10;

  @override
  ModelMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelMessage(
      id: fields[0] as int,
      messageBody: fields[1] as String,
      dateTime: fields[3] as DateTime,
      recepinetId: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ModelMessage obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.messageBody)
      ..writeByte(2)
      ..write(obj.recepinetId)
      ..writeByte(3)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
