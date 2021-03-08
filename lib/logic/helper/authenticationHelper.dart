import 'package:animore/logic/model/modelUser.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class AuthenticationHelper{
  Future<void> fetchUser(Map<String, dynamic> body) async{
    ModelUser user = ModelUser.fromJson(body['user']);
    (await Hive.openBox("user")).put("user", user);
    await saveToken(body['access_token']);
  }

  Future<void> saveToken(String token) async{
    final secureStorage = FlutterSecureStorage();
    await secureStorage.write(key: "token", value: token);
  }

  Future<void> deleteToken() async{
    final secureStorage = FlutterSecureStorage();
    await secureStorage.delete(key: "token");
  }

  Future<String> readToken() async{
    final secureStorage = FlutterSecureStorage();
    return await secureStorage.read(key: "token");
  }

  ModelUser getUser(){
    return Hive.box("user").get("user");
  }
}