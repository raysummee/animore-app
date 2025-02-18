import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/logic/util/validator.dart';
import 'package:animore/ux/components/button/primaryRoundedButton.dart';
import 'package:flutter/material.dart';

class WelcomeCredentialPage extends StatefulWidget {
  final bool isLogin;
  WelcomeCredentialPage({this.isLogin:true});

  @override
  _WelcomeCredentialPageState createState() => _WelcomeCredentialPageState();
}

class _WelcomeCredentialPageState extends State<WelcomeCredentialPage> {
  bool isLogin;
  TextEditingController fullNameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController confirmController;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  void initState() {
    isLogin = widget.isLogin;
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        bottom: false,
        child: Row(
          children: [
            if(MediaQuery.of(context).size.width>1200)...[
              Flexible(
                flex: 2,
                child: Container(
                  height: double.infinity,
                  color: Colors.cyan,
                  child: Image.asset("lib/assets/images/dog_food.png", fit: BoxFit.cover,)
                ),
              )
            ],
            Flexible(
              flex: 2,
              child: Container(
                margin: EdgeInsets.fromLTRB(22, 16, 22, 8),
                child: SingleChildScrollView(
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height-kToolbarHeight-kBottomNavigationBarHeight
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Form(
                          key: this._formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.arrow_back, size: 34,),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 8, 16, 5),
                                child: Text(
                                  isLogin? "Let's sign you in.": "Let's setup your account now",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                              isLogin? Padding(
                                padding: const EdgeInsets.fromLTRB(16, 5, 16, 32),
                                child: Text(
                                  "Welcome back.\nYou've been missed!",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                              ):Container(),
                              isLogin?Container():Padding(
                                padding: const EdgeInsets.fromLTRB(16, 28, 16, 8),
                                child: TextFormField(
                                  controller: fullNameController,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: Validator.validateFullname(),
                                  decoration: InputDecoration(
                                    labelText: "Full Name",
                                    contentPadding: EdgeInsets.fromLTRB(22, 22, 22, 22),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                                child: TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: Validator.validateEmail(),
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  onChanged: (val){
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    contentPadding: EdgeInsets.fromLTRB(22, 22, 22, 22),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                                child: TextFormField(
                                  obscureText: true,
                                  controller: passwordController,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  onChanged: (val){
                                  },
                                  validator: Validator.validatePassword(isLogin),
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    contentPadding: EdgeInsets.fromLTRB(22, 22, 22, 22),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )
                                  ),
                                ),
                              ),
                              isLogin?Container():Padding(
                                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                                child: TextFormField(
                                  obscureText: true,
                                  controller: confirmController,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  onChanged: (val){
                                  },
                                  validator: (val){
                                    if(val==passwordController.text){
                                      return null;
                                    }else{
                                      return "confirm password doesn't match";
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Confirm Password",
                                    contentPadding: EdgeInsets.fromLTRB(22, 22, 22, 22),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  isLogin? "Don't have a account?": "Have an account already?"
                                ),
                                TextButton(
                                  onPressed: (){
                                    setState(() {
                                      isLogin = !isLogin;
                                    });
                                  }, 
                                  child: Text(
                                    isLogin? "Register": "Login"
                                  )
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 16, 30),
                              child: PrimaryRoundedButton(
                                label: "Sign In", 
                                onPressed: (){
                                  if(!this._formKey.currentState.validate()) return;
                                  if(isLogin){
                                    Auth().login(
                                      emailController.text, 
                                      passwordController.text,
                                      context
                                    );
                                  }else{
                                    Auth().signup(
                                      fullNameController.text,
                                      emailController.text, 
                                      passwordController.text, 
                                      confirmController.text,
                                      context
                                    );
                                  }
                                },
                              )
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}