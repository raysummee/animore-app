import 'dart:convert';

import 'package:animore/logic/api/apiConfig.dart';
import 'package:animore/logic/enum/bookStatusEnum.dart';
import 'package:animore/logic/helper/veterinaryHelper.dart';
import 'package:animore/logic/model/modelDoctor.dart';
import 'package:intl/intl.dart';

import 'base/baseHttp.dart' as http;

class ApiVeterinary{
  Future<void> getAllVeterinaryRequest() async{
    var url = Uri.parse("$host/veterinary");

    http.get(
      url,
      needAuth: true,
      onSuccess: (map) async{
        await VeterinaryHelper().fetchAll(map);
        return true;
      }
    );
  }

  Future<bool> bookVeterinaryRequest(ModelDoctor doctor) async{
    var url = Uri.parse("$host/veterinary/book");
    var pet = 1;
    var inputBody = json.encode({
      "pet_id": pet,
      "veterinary_id": doctor.id,
      "onDate": DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now())
    });

    return await http.post(
      url,
      body: inputBody,
      needAuth: true,
      onSuccess: (map) async{
        doctor.status = BookStatusEnum.booked;
        VeterinaryHelper().updateOne(doctor);
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

  Future<void> getAllBookingsRequest() async{
    var url = Uri.parse("$host/veterinary/book");

    await http.get(
      url,
      needAuth: true,
      onSuccess: (map) async{
        VeterinaryHelper().fetchAllBookings(map);
        return true;
      }
    );
  }
}