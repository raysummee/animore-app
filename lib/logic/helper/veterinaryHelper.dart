import 'package:animore/logic/model/modelDoctor.dart';
import 'package:hive/hive.dart';

class VeterinaryHelper{
  Future<void> fetchAll(Map body) async{
    Box<ModelDoctor> box = await Hive.openBox<ModelDoctor>("veterinary");
    List<ModelDoctor>  medics = (body['veterinary'] as List).map((e) => ModelDoctor.fromJson(e)).toList();
    
    await box.clear();
    for(var medic in medics){
      await box.put(medic.id, medic);
    }
  }

  Future<void> updateOne(ModelDoctor modelDoctor) async{
    Box<ModelDoctor> box = await Hive.openBox<ModelDoctor>("veterinary");
    await box.put(modelDoctor.id, modelDoctor);
  }
}