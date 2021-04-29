import 'package:animore/logic/model/modelPet.dart';
import 'package:hive/hive.dart';

class PetHelper {
  Future<bool> fetchPet(Map<String, dynamic> map) async{
    print("api pet");
    List<ModelPet> pets = (map['pet'] as List).map((e) => ModelPet.fromJson(e)).toList();
    await(await Hive.openBox<ModelPet>("pet")).addAll(pets);
    return true;
  }

  Future<bool> updatePet(int index,int petId, String name, String bread, String type, DateTime dob) async{
    ModelPet modelPet = ModelPet(
      id: petId, 
      name: name, 
      bread: bread, 
      dob: dob,
      image: null, 
      type: type,
    );
    (await Hive.openBox<ModelPet>("pet")).put(index, modelPet);
    return true;
  }

  Future<List<ModelPet>> getAllPets() async{
    return (await Hive.openBox<ModelPet>("pet")).values.toList();
  }

  Future<ModelPet> getPetAt(int index) async{
    Box<ModelPet> box = await Hive.openBox<ModelPet>("pet");
    return box.getAt(index);
  }
}