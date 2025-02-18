
import 'package:animore/logic/api/apiConfig.dart';
import 'package:animore/logic/helper/veterinaryHelper.dart';
import 'package:animore/logic/model/modelDoctor.dart';

import 'base/baseHttp.dart' as http;

class ApiVeterinary{
  Future<void> all() async{
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

  Future<ModelDoctor> specific(int vetId) async{
    var url = Uri.parse("$host/veterinary/$vetId");

    return await http.get(
      url,
      needAuth: true,
      needBool: false,
      onSuccess: (map) async{
        return await VeterinaryHelper().fetchSpecific(map);
      }
    );
  }

  Future<void> authenticated() async{
    var url = Uri.parse("$host/veterinary/auth");

    http.get(
      url,
      needAuth: true,
      onSuccess: (map) async{
        await VeterinaryHelper().fetchAuthenticated(map);
        return true;
      }
    );
  }
}