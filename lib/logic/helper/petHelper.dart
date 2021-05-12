import 'package:animore/logic/api/apiTodos.dart';
import 'package:animore/logic/helper/todosHelper.dart';
import 'package:animore/logic/model/modelPet.dart';
import 'package:animore/logic/provider/petSelectNotify.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:animore/main.dart';

class PetHelper {
  Future<bool> fetch(Map<String, dynamic> map) async{
    print("api pet");
    List<ModelPet> pets = (map['pet'] as List).map((e) => ModelPet.fromJson(e)).toList();
    Box<ModelPet> box = await Hive.openBox<ModelPet>("pet");
    await box.clear();

    Map<dynamic, ModelPet> petsK = Map.fromIterable(pets, key: (pet)=> pet.id);
    print(petsK.keys);
    await box.putAll(petsK);
    var provider = Provider.of<PetSelectNotify>(navigatorKey.currentContext, listen: false);
    provider.id = pets[0].id;
    return true;
  }

  Future<bool> update(int index,int petId, String name, String bread, String type, DateTime dob) async{
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

  Future<List<ModelPet>> all() async{
    return (await Hive.openBox<ModelPet>("pet")).values.toList();
  }


  Box<ModelPet> box(){
    return Hive.box<ModelPet>("pet");
  }

  int selectedPetId(BuildContext context){
    var provider = Provider.of<PetSelectNotify>(context, listen: false);
    return provider.id;
  }

  int defaultPetId(){
    Box<int> box = Hive.box<int>("SelectedPet");
    if(box.isEmpty)return null;
    return box.getAt(0);
  }

  void setSelectedPetIdToDefault(){
    if(PetHelper().defaultPetId()!=null){
      var provider = Provider.of<PetSelectNotify>(navigatorKey.currentContext, listen: false);
      provider.id = PetHelper().defaultPetId();
    }
  }
}