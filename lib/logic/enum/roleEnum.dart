import 'package:hive/hive.dart';
part 'roleEnum.g.dart';

@HiveType(typeId: 8)
enum RoleEnum{
  @HiveField(0)
  basic,
  @HiveField(1)
  pro,
  @HiveField(2)
  admin,
  @HiveField(3)
  doctor,
  @HiveField(4)
  merchant
}

RoleEnum roleEnumFromString(String status){
  return RoleEnum.values.firstWhere((e) => roleEnumToString(e) == status);
}
String roleEnumToString(RoleEnum status){
  return status.toString().split(".").last;
}