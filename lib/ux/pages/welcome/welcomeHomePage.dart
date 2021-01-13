import 'package:animore/ux/components/button/ovalBigButton.dart';
import 'package:animore/ux/components/button/wideRoundedButton.dart';
import 'package:animore/ux/pages/welcome/subPages/petForm.dart';
import 'package:flutter/material.dart';

class WelcomeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff00D2E1)
        ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("lib/assets/images/dog_anim_2.gif",),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Hey!",
                    style: TextStyle(
                      fontSize: 75,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 5, 30, 10),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Welcome to Animore!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(60, 10, 60, 50),
              child: OvalBigButton("Get Started", ()=> Navigator.of(context).push(
                MaterialPageRoute(builder: (_)=> PetForm())
              ))
            )
          ],
        ),
      ),
    );
  }
}