import 'package:flutter/material.dart';

class SigninButton extends StatefulWidget {
  @override
  _SigninButtonState createState() => _SigninButtonState();
}

class _SigninButtonState extends State<SigninButton> {
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      buttonColor: Colors.cyan,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      height: 50,
      child: RaisedButton(
        onPressed: () async{
          setState(() {
            isLoading = true;
          });
          // if(await GoogleAuth().handleSignInGoogle(context) !=null){
            // Navigator.of(context).pop(true);
            
          // }else{
            setState(() {
              isLoading = false;
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text("Error loggin in!"))
              );
            });
          // }
        },
        child: !isLoading? Text(
          "Sign In",
          style: TextStyle(
            color: Colors.white
          ),
        ):
        CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}