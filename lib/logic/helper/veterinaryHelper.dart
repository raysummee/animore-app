import 'package:animore/logic/model/modelDoctor.dart';
import 'package:animore/logic/model/modelVetBook.dart';
import 'package:hive/hive.dart';

class VeterinaryHelper{
  Future<void> fetchAllVeterinary(Map body) async{
    Box<ModelDoctor> box = await Hive.openBox<ModelDoctor>("veterinary");
    if((body['veterinary'] as List).isEmpty) return await box.clear();

    List<ModelDoctor>  medics = (body['veterinary'] as List).map((e) => ModelDoctor.fromJson(e)).toList();
    
    await box.clear();
    for(var medic in medics){
      await box.put(medic.id, medic);
    }
  }

  Future<ModelDoctor> fetchSpecificVeterinary(Map body) async{
    return ModelDoctor.fromJson(body['veterinary']);
  }

  Future<void> fetchAuthenticatedVeterinary(Map body) async{
    Box<ModelDoctor> box = await Hive.openBox<ModelDoctor>("veterinaryAuth");
    ModelDoctor vet = ModelDoctor.fromJson(body['veterinary']);
    await box.put("veterinaryAuth", vet);
  }

  Future<void> updateVeterinary(ModelDoctor modelDoctor) async{
    Box<ModelDoctor> box = await Hive.openBox<ModelDoctor>("veterinary");
    await box.put(modelDoctor.id, modelDoctor);
  }

  Future<void> updateAuthenticatedVeterinary(ModelDoctor modelDoctor) async{
    Box<ModelDoctor> box = await Hive.openBox<ModelDoctor>("veterinaryAuth");
    await box.put("veterinaryAuth", modelDoctor);
  }
}