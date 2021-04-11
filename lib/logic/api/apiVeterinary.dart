import 'package:animore/logic/api/apiConfig.dart';

import 'base/baseHttp.dart' as http;

class ApiVeterinary{
  Future<void> getAllVeterinaryRequest() async{
    var url = Uri.parse("$host/veterinary");

    http.get(
      url,
      needAuth: true,
      onSuccess: (map) async{
        
        return true;
      }
    );
  }
}