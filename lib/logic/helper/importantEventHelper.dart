import 'package:animore/logic/model/modelImportantEvent.dart';
import 'package:hive/hive.dart';

class ImportantEventHelper{
  Future<void> fetchImportantEvent(Map body) async{
    Box<ModelImportantEvent> box = await Hive.openBox<ModelImportantEvent>("importantEvent");
    List<ModelImportantEvent> importantEvents = (body['important_dates'] as List).map((importantDate) => ModelImportantEvent.fromJson(importantDate)).toList();
    //sorting according to date so date recent is at the index 0
    importantEvents.sort((a,b)=>a.dateTime.compareTo(b.dateTime));
    await box.clear();
    await box.addAll(importantEvents);
  }

  List<ModelImportantEvent> getAllImportantEvents(){
    Box<ModelImportantEvent> box = Hive.box<ModelImportantEvent>("importantEvent");
    return box.values.toList();
  }

  ModelImportantEvent getRecentImportantEvent(){
    Box<ModelImportantEvent> box = Hive.box<ModelImportantEvent>("importantEvent");
    if(box.isEmpty) return null;
    return box.getAt(0);
  }

  Future<void> addIntoLocalImportantEvent(ModelImportantEvent event) async{
    Box<ModelImportantEvent> box = await Hive.openBox<ModelImportantEvent>("importantEvent");
    List<ModelImportantEvent> events = box.values.toList();
    events.add(event);
    events.sort((a,b)=>a.dateTime.compareTo(b.dateTime));
    await box.clear();
    await box.addAll(events);
  }

  Future<void> updateLocalImportantEvent(ModelImportantEvent event, int index) async{
    Box<ModelImportantEvent> box = await Hive.openBox<ModelImportantEvent>("importantEvent");
    await box.putAt(index, event);
  }

}