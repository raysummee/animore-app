import 'package:animore/logic/model/modelPet.dart';
import 'package:animore/logic/provider/petSelectNotify.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class PetHelper {
  Future<bool> fetch(Map<String, dynamic> map) async{
    print("api pet");
    List<ModelPet> pets = (map['pet'] as List).map((e) => ModelPet.fromJson(e)).toList();
    Box<ModelPet> box = await Hive.openBox<ModelPet>("pet");
    await box.clear();
    await box.addAll(pets);
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

  Future<ModelPet> at(int index) async{
    Box<ModelPet> box = await Hive.openBox<ModelPet>("pet");
    return box.getAt(index);
  }

  Box<ModelPet> box(){
    return Hive.box<ModelPet>("pet");
  }

  ModelPet selectedPet(BuildContext context){
    var provider = Provider.of<PetSelectNotify>(context);
    return Hive.box<ModelPet>("pet").getAt(provider.index);
  }

  Future<ModelPet> selectedPetAsync(BuildContext context) async{
    var provider = Provider.of<PetSelectNotify>(context);
    return (await Hive.openBox<ModelPet>("pet")).getAt(provider.index);
  }
}