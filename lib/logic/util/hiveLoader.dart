import 'package:animore/logic/helper/todosHelper.dart';
import 'package:animore/logic/model/modelImportantEvent.dart';
import 'package:animore/logic/model/modelPet.dart';
import 'package:animore/logic/model/modelTodos.dart';
import 'package:animore/logic/model/modelUser.dart';
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

    await Hive.openBox<ModelPet>("pet");
    await TodosHelper().openTodayWeekTodosBox();
    await Hive.openBox("user");
    await Hive.openBox<ModelImportantEvent>("importantEvent");
 
  }

  Future<void> dispose() async{
    Hive.close();
  }
}