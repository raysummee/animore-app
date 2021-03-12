import 'package:animore/ux/components/button/primaryRoundedButton.dart';
import 'package:flutter/material.dart';

class WelcomeCredentialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Row(
          children: [
            if(MediaQuery.of(context).size.width>800)...[
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                            "Let's sign you in.",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 5, 16, 8),
                          child: Text(
                            "Welcome back.\nYou've been missed!",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 28, 16, 8),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Email or Username",
                              contentPadding: EdgeInsets.fromLTRB(22, 22, 22, 22),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              contentPadding: EdgeInsets.fromLTRB(22, 22, 22, 22),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              )
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Don't have a account?"),
                            TextButton(
                              onPressed: (){}, 
                              child: Text(
                                " Register"
                              )
                            )
                          ],
                        ),
                        SizedBox(height: 6,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 33),
                          child: PrimaryRoundedButton(
                            label: "Sign In", 
                            onPressed: (){},
                          )
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}