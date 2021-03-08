// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelTodos.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelTodosAdapter extends TypeAdapter<ModelTodos> {
  @override
  final int typeId = 2;

  @override
  ModelTodos read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelTodos(
      id: fields[0] as int,
      done: fields[1] as int,
      time: fields[3] as DateTime,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ModelTodos obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.done)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelTodosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
