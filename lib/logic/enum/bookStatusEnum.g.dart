// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookStatusEnum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookStatusEnumAdapter extends TypeAdapter<BookStatusEnum> {
  @override
  final int typeId = 7;

  @override
  BookStatusEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BookStatusEnum.booked;
      case 1:
        return BookStatusEnum.accepted;
      case 2:
        return BookStatusEnum.denied;
      case 3:
        return BookStatusEnum.cancled;
      case 4:
        return BookStatusEnum.completed;
      case 5:
        return BookStatusEnum.none;
      default:
        return BookStatusEnum.booked;
    }
  }

  @override
  void write(BinaryWriter writer, BookStatusEnum obj) {
    switch (obj) {
      case BookStatusEnum.booked:
        writer.writeByte(0);
        break;
      case BookStatusEnum.accepted:
        writer.writeByte(1);
        break;
      case BookStatusEnum.denied:
        writer.writeByte(2);
        break;
      case BookStatusEnum.cancled:
        writer.writeByte(3);
        break;
      case BookStatusEnum.completed:
        writer.writeByte(4);
        break;
      case BookStatusEnum.none:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookStatusEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
