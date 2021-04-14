import 'package:hive/hive.dart';
part 'bookStatusEnum.g.dart';

@HiveType(typeId: 7)
enum BookStatusEnum{
  @HiveField(0)
  booked,
  @HiveField(1)
  accepted,
  @HiveField(2)
  denied,
  @HiveField(3)
  cancled,
  @HiveField(4)
  completed,
  @HiveField(5)
  none
}

BookStatusEnum statusEnumFromString(String status){
  return BookStatusEnum.values.firstWhere((e) => statusEnumToString(e) == status);
}
String statusEnumToString(BookStatusEnum status){
  return status.toString().split(".").last;
}