import 'package:animore/logic/model/modelDoctor.dart';
import 'package:animore/logic/model/modelVetBook.dart';
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

  Future<void> updateOne(ModelDoctor modelDoctor) async{
    Box<ModelDoctor> box = await Hive.openBox<ModelDoctor>("veterinary");
    await box.put(modelDoctor.id, modelDoctor);
  }

  Future<void> fetchAllBookings(Map body) async{
    Box<ModelVetBook> box = await Hive.openBox<ModelVetBook>("vetBook");

    if((body['vetBook'] as List).isEmpty) return await box.clear();

    List<ModelVetBook>  bookings = (body['vetBook'] as List).map((e) => ModelVetBook.fromJson(e)).toList();

    print("booking");
    print(bookings[0]);
    
    await box.clear();
    for(var booking in bookings){
      await box.put(booking.id, booking);
    }
  }

  Future<void> updateBooking(ModelVetBook vetBook) async{
    Box<ModelVetBook> box = await Hive.openBox<ModelVetBook>("vetBook");
    await box.put(vetBook.id, vetBook);
  }
}