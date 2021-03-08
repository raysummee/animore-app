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

  ModelUser user(){
    return AuthenticationHelper().getUser();
  }
}