import 'package:animore/logic/api/apiConfig.dart';
import 'package:animore/logic/helper/veterinaryHelper.dart';

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
}