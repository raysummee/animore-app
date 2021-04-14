// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roleEnum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoleEnumAdapter extends TypeAdapter<RoleEnum> {
  @override
  final int typeId = 8;

  @override
  RoleEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RoleEnum.basic;
      case 1:
        return RoleEnum.pro;
      case 2:
        return RoleEnum.admin;
      case 3:
        return RoleEnum.doctor;
      case 4:
        return RoleEnum.merchant;
      default:
        return RoleEnum.basic;
    }
  }

  @override
  void write(BinaryWriter writer, RoleEnum obj) {
    switch (obj) {
      case RoleEnum.basic:
        writer.writeByte(0);
        break;
      case RoleEnum.pro:
        writer.writeByte(1);
        break;
      case RoleEnum.admin:
        writer.writeByte(2);
        break;
      case RoleEnum.doctor:
        writer.writeByte(3);
        break;
      case RoleEnum.merchant:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoleEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
