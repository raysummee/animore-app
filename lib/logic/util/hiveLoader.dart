import 'package:animore/logic/enum/bookStatusEnum.dart';
import 'package:animore/logic/enum/roleEnum.dart';
import 'package:animore/logic/helper/todosHelper.dart';
import 'package:animore/logic/model/modelDoctor.dart';
import 'package:animore/logic/model/modelImportantEvent.dart';
import 'package:animore/logic/model/modelMessage.dart';
import 'package:animore/logic/model/modelPet.dart';
import 'package:animore/logic/model/modelTodos.dart';
import 'package:animore/logic/model/modelUser.dart';
import 'package:animore/logic/model/modelVetBook.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveLoader{
  Future<void> init() async{
    if(!kIsWeb)
    await Hive.initFlutter();
    Hive.registerAdapter(ModelPetAdapter());
    Hive.registerAdapter(ModelTodosAdapter());
    Hive.registerAdapter(ModelUserAdapter());
    Hive.registerAdapter(ModelImportantEventAdapter());
    Hive.registerAdapter(ModelDoctorAdapter());
    Hive.registerAdapter(BookStatusEnumAdapter());
    Hive.registerAdapter(RoleEnumAdapter());
    Hive.registerAdapter(ModelVetBookAdapter());
    Hive.registerAdapter(ModelMessageAdapter());

    await Hive.openBox<ModelPet>("pet");
    await TodosHelper().todayFuture();
    await TodosHelper().tomorrowFuture();
    await Hive.openBox<ModelUser>("user");
    await Hive.openBox("tokenTemp");//TODO need to delete when found alt for storing jwt in web
    await Hive.openBox<ModelImportantEvent>("importantEvent");

    await Hive.openBox<ModelDoctor>("veterinary");
    await Hive.openBox<ModelVetBook>("vetBook");

    await Hive.openBox<ModelMessage>("messages");
 
  }

  Future<void> dispose() async{
    Hive.close();
  }
}