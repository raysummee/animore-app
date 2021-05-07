import 'package:animore/logic/model/modelImportantEvent.dart';
import 'package:hive/hive.dart';

class ImportantEventHelper{
  Future<void> fetch(Map body) async{
    Box<ModelImportantEvent> box = await Hive.openBox<ModelImportantEvent>("importantEvent");
    List<ModelImportantEvent> importantEvents = (body['important_dates'] as List).map((importantDate) => ModelImportantEvent.fromJson(importantDate)).toList();
    //sorting according to date so date recent is at the index 0
    importantEvents.sort((a,b)=>a.dateTime.compareTo(b.dateTime));
    await box.clear();
    await box.addAll(importantEvents);
  }

  List<ModelImportantEvent> all(){
    Box<ModelImportantEvent> box = Hive.box<ModelImportantEvent>("importantEvent");
    return box.values.toList();
  }

  ModelImportantEvent recent(){
    Box<ModelImportantEvent> box = Hive.box<ModelImportantEvent>("importantEvent");
    if(box.isEmpty) return null;
    DateTime compareTime = DateTime.now().subtract(Duration(days: 1));
    return box.values.where((element) => element.dateTime.isAfter(compareTime)).first;
  }

  Future<void> addIntoLocal(ModelImportantEvent event) async{
    Box<ModelImportantEvent> box = await Hive.openBox<ModelImportantEvent>("importantEvent");
    await box.add(event);
  }

  Future<void> updateLocal(ModelImportantEvent event, int index) async{
    Box<ModelImportantEvent> box = await Hive.openBox<ModelImportantEvent>("importantEvent");
    await box.putAt(index, event);
  }

  Future<void> deleteLocal(int index) async{
    Box<ModelImportantEvent> box = await Hive.openBox<ModelImportantEvent>("importantEvent");
    await box.deleteAt(index);
  }

}