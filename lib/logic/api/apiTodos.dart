
import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/logic/api/base/baseHttp.dart' as http;
import 'package:animore/logic/helper/todosHelper.dart';

import 'apiConfig.dart';
class ApiTodos{
  Future<void> getTodosAllRequest() async{
    const petId = 2;
    var url = Uri.parse("$host/todos/$petId");
    http.get(
      url,
      onSuccess: (map) async{
        print("api todos");
        await TodosHelper().fetchTodos(map);
        return true;
      }
    );
  } 
}