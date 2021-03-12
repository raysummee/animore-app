import 'package:animore/ux/components/button/primaryRoundedButton.dart';
import 'package:flutter/material.dart';

class WelcomeCredentialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(22, 8, 22, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, size: 34), 
                    onPressed: (){
                      Navigator.of(context).pop();
                    }
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
                  Text("Don't have a account? Register"),
                  SizedBox(height: 6,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
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
    );
  }
}