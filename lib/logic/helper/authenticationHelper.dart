import 'package:animore/logic/model/modelUser.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class AuthenticationHelper{
  Future<void> fetchUser(Map<String, dynamic> body) async{
    ModelUser user = ModelUser.fromJson(body['user']);
    (await Hive.openBox<ModelUser>("user")).put("user", user);
    await saveToken(body['access_token']);
  }

  ModelUser getUser(){
    return Hive.box<ModelUser>("user").get("user");
  }

  Future<void> deleteUser() async{
    await (await Hive.openBox<ModelUser>("user")).delete("user");
    await deleteToken(); 
  }

  Future<void> saveToken(String token) async{
    if(!kIsWeb){
      final secureStorage = FlutterSecureStorage();
      await secureStorage.write(key: "token", value: token);
    }else{
      //TODO replace this to a better secure db for web
      await (await Hive.openBox("tokenTemp")).put("token", token);
    }
  }

  Future<void> deleteToken() async{
    if(!kIsWeb){
      final secureStorage = FlutterSecureStorage();
      await secureStorage.delete(key: "token");
    }{
      //TODO replace this to a better secure db for web
      await (await Hive.openBox("tokenTemp")).delete("token");
    }
  }

  Future<String> readToken() async{
    if(!kIsWeb){
      final secureStorage = FlutterSecureStorage();
      return await secureStorage.read(key: "token");
    }else{
      //TODO replace this to a better secure db for web
      return Future.value((await Hive.openBox("tokenTemp")).get("token"));
    }
  }
}