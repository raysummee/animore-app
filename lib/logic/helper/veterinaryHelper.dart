import 'package:animore/logic/model/modelDoctor.dart';
import 'package:hive/hive.dart';

class VeterinaryHelper{
  Future<void> fetchAll(Map body) async{
    Box<ModelDoctor> box = await Hive.openBox<ModelDoctor>("veterinary");
    if((body['veterinary'] as List).isEmpty) return await box.clear();

    List<ModelDoctor>  medics = (body['veterinary'] as List).map((e) => ModelDoctor.fromJson(e)).toList();
    
    await box.clear();
    for(var medic in medics){
      await box.put(medic.id, medic);
    }
  }

  Future<ModelDoctor> fetchSpecific(Map body) async{
    return ModelDoctor.fromJson(body['veterinary']);
  }

  Future<void> fetchAuthenticated(Map body) async{
    Box<ModelDoctor> box = await Hive.openBox<ModelDoctor>("veterinaryAuth");
    ModelDoctor vet = ModelDoctor.fromJson(body['veterinary']);
    await box.put("veterinaryAuth", vet);
  }

  Future<void> update(ModelDoctor modelDoctor) async{
    Box<ModelDoctor> box = await Hive.openBox<ModelDoctor>("veterinary");
    await box.put(modelDoctor.id, modelDoctor);
  }

  Future<void> updateAuthenticated(ModelDoctor modelDoctor) async{
    Box<ModelDoctor> box = await Hive.openBox<ModelDoctor>("veterinaryAuth");
    await box.put("veterinaryAuth", modelDoctor);
  }
}