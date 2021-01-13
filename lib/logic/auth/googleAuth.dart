import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//backend of google sign in
class GoogleAuth {
    // FirebaseUser user;
    // final GoogleSignIn _googleSignIn = GoogleSignIn();
    // final FirebaseAuth _auth = FirebaseAuth.instance;

    // //public method returning user via google auth
    // Future<FirebaseUser> handleSignInGoogle(BuildContext context) async {
    //   try{
    //     final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    //     if(googleUser!=null){
    //       final GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
          
    //       //requesting credential google
    //       final AuthCredential credential = GoogleAuthProvider.getCredential(
    //         idToken: googleSignInAuthentication.idToken, 
    //         accessToken: googleSignInAuthentication.accessToken
    //       );
          
    //       //_auth.fetchSignInMethodsForEmail(email: googleUser.email);//
    //       //returning these user, to check is signin or not
          
    //       user = (await _auth.signInWithCredential(credential)).user;
            
    //       //console print
    //       print('sign in '+ user.displayName);
    //     }
    //   }catch(e){
    //     print(e);
    //     //fb auth will be override with google, it is a default behavior we can do anything with it.
    //     if(e.code =="ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL"){
          
    //     }
    //   }
    //   if(user!=null){
    //     return user;
    //   }
    //   return null;
    // }

    // //to get google credentials
    // Future<AuthCredential> getGoogleCredential() async{
    //   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    //   final GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
      
    //   //returning credential google
    //   return GoogleAuthProvider.getCredential(
    //     idToken: googleSignInAuthentication.idToken, 
    //     accessToken: googleSignInAuthentication.accessToken
    //   );
    // }
}

