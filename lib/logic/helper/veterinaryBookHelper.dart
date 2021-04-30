import 'package:animore/logic/enum/bookStatusEnum.dart';
import 'package:animore/logic/model/modelVetBook.dart';
import 'package:hive/hive.dart';

class VeterinaryBookHelper{
  Future<void> fetchAllBookings(Map body) async{
    Box<ModelVetBook> box = await Hive.openBox<ModelVetBook>("vetBook");

    if((body['vetBook'] as List).isEmpty) return await box.clear();

    List<ModelVetBook>  bookings = (body['vetBook'] as List).map((e) => ModelVetBook.fromJson(e)).toList();
    
    // bookings.sort((a, b)=> a.onDate.compareTo(b.onDate));

    print("vet fetch ${bookings[0].onDate}");
    
    await box.clear();
    for(var booking in bookings){
      await box.put(booking.id, booking);
    }
  }

  Future<void> updateBooking(ModelVetBook vetBook) async{
    Box<ModelVetBook> box = await Hive.openBox<ModelVetBook>("vetBook");
    await box.put(vetBook.id, vetBook);
  }

  List<ModelVetBook> getPendingBookingsSync(){
    return Hive.box<ModelVetBook>("vetBook").values.where(
      (element) => element.status==BookStatusEnum.booked||
      element.status==BookStatusEnum.accepted
    ).toList();
  }

  List<ModelVetBook> getCompetedBookingsSync(){
    return Hive.box<ModelVetBook>("vetBook").values.where(
      (element) => element.status==BookStatusEnum.completed
    ).toList();
  }
}