import 'dart:convert';

import 'package:animore/logic/api/apiConfig.dart';
import 'package:animore/logic/enum/bookStatusEnum.dart';
import 'package:animore/logic/helper/petHelper.dart';
import 'package:animore/logic/helper/veterinaryHelper.dart';
import 'package:animore/logic/model/modelDoctor.dart';
import 'package:intl/intl.dart';

import 'base/baseHttp.dart' as http;

class ApiVeterinary{
  Future<void> getAllVeterinary() async{
    var url = Uri.parse("$host/veterinary");

    http.get(
      url,
      needAuth: true,
      onSuccess: (map) async{
        await VeterinaryHelper().fetchAllVeterinary(map);
        return true;
      }
    );
  }

  Future<ModelDoctor> getSpecificVeterinary(int vetId) async{
    var url = Uri.parse("$host/veterinary/$vetId");

    return await http.get(
      url,
      needAuth: true,
      needBool: false,
      onSuccess: (map) async{
        return await VeterinaryHelper().fetchSpecificVeterinary(map);
      }
    );
  }

  Future<void> getAuthenticatedVeterinary() async{
    var url = Uri.parse("$host/veterinary/auth");

    http.get(
      url,
      needAuth: true,
      onSuccess: (map) async{
        await VeterinaryHelper().fetchAuthenticatedVeterinary(map);
        return true;
      }
    );
  }
}