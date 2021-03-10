import 'package:animore/logic/api/authentication/apiAuthentication.dart';
import 'package:animore/logic/model/modelUser.dart';
import 'package:animore/logic/Helper/authenticationHelper.dart';

class Auth{
  Future<void> login(String email, String password) async{
    if(await ApiAuthentication().loginEmailApiRequest(email, password)){
      print("succeed");
    }else{
      print("failed");
    }
  }

  Future<void> signup(String name, String email, String password, String passwordConfrim) async{
    if(await ApiAuthentication().registerEmailApiRequest(name, email, password, passwordConfrim)){
      print("succeed");
    }else{
      print("failed");
    }
  }

  Future<void> logout() async{
    await ApiAuthentication().logoutApiRequest();
  }

  ModelUser user(){
    return AuthenticationHelper().getUser();
  }
}