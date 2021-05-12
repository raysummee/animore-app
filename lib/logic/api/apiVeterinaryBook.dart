import 'dart:convert';

import 'package:animore/logic/enum/bookStatusEnum.dart';
import 'package:animore/logic/helper/petHelper.dart';
import 'package:animore/logic/helper/veterinaryBookHelper.dart';
import 'package:animore/logic/helper/veterinaryHelper.dart';
import 'package:animore/logic/model/modelDoctor.dart';
import 'package:intl/intl.dart';
import '../../main.dart';
import 'base/baseHttp.dart' as http;
import 'apiConfig.dart';

class ApiVeterinaryBook{
   Future<bool> makeAppointment(ModelDoctor doctor) async{
    var url = Uri.parse("$host/veterinary/book");
    final petId = PetHelper().selectedId(navigatorKey.currentContext);    
    var inputBody = json.encode({
      "pet_id": petId,
      "veterinary_id": doctor.id,
      "onDate": DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now())
    });

    return await http.post(
      url,
      body: inputBody,
      needAuth: true,
      onSuccess: (map) async{
        doctor.status = BookStatusEnum.booked;
        VeterinaryHelper().update(doctor);
        return true;
      },
      onServerError: (map) async{
        return false;
      },
      onServerUnavailable: (map) async{
        return false;
      },
      onBadRequest: (map) async{
        return false;
      },
      onForibidded: (map) async{
        return false;
      },
      onNotFound: (map) async{
        return false;
      },
      onTooManyRequest: (map) async{
        return false;
      },
      onUnathorized: (map) async{
        return false;
      },
    );
  }

  Future<void> allAppointmentAuthenticated() async{
    var url = Uri.parse("$host/veterinary/book");

    await http.get(
      url,
      needAuth: true,
      onSuccess: (map) async{
        VeterinaryBookHelper().fetchAll(map);
        return true;
      }
    );
  }
}