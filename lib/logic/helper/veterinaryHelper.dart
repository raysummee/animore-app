import 'package:animore/logic/model/modelDoctor.dart';
import 'package:hive/hive.dart';

class VeterinaryHelper{
  Future<void> fetchAll(Map body) async{
    Box<ModelDoctor> box = await Hive.openBox<ModelDoctor>("veterinary");
    List<ModelDoctor>  medics = (body['veterinary'] as List).map((e) => ModelDoctor.fromJson(e)).toList();
    await box.clear();
    await box.addAll(medics);
  }
}