import 'package:animore/logic/model/modelImportantEvent.dart';
import 'package:hive/hive.dart';

class ImportantEventHelper{
  Future<void> fetchImportantEvent(Map body) async{
    Box<ModelImportantEvent> box = await Hive.openBox<ModelImportantEvent>("importantEvent");
    List<ModelImportantEvent> importantEvents = (body['important_dates'] as List).map((importantDate) => ModelImportantEvent.fromJson(importantDate)).toList();
    //sorting according to date so date recent is at the index 0
    importantEvents.sort((a,b)=>a.dateTime.compareTo(b.dateTime));
    print(importantEvents[0].name);
    await box.clear();
    await box.addAll(importantEvents);
  }

  List<ModelImportantEvent> getAllImportantEvents(){
    Box<ModelImportantEvent> box = Hive.box<ModelImportantEvent>("importantEvent");
    return box.values;
  }

  ModelImportantEvent getRecentImportantEvent(){
    Box<ModelImportantEvent> box = Hive.box<ModelImportantEvent>("importantEvent");
    if(box.isEmpty) return null;
    return box.getAt(0);
  }

}