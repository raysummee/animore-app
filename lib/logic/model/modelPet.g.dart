// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelPet.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelPetAdapter extends TypeAdapter<ModelPet> {
  @override
  final int typeId = 1;

  @override
  ModelPet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelPet(
      id: fields[0] as int,
      name: fields[1] as String,
      bread: fields[2] as String,
      dob: fields[3] as String,
      image: fields[5] as String,
      type: fields[4] as String,
      userId: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ModelPet obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.bread)
      ..writeByte(3)
      ..write(obj.dob)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelPetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
