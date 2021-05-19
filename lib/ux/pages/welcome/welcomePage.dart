import 'package:animore/ux/components/button/primaryIconButton.dart';
import 'package:animore/ux/components/complex/carousel/carouselLanding.dart';
import 'package:animore/ux/pages/welcome/welcomeCredentialPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CarouselLanding(),
            ),
            Container(
              margin: EdgeInsets.only(top: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ 
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 22, 40, 0),
                    child: PrimaryIconButton(
                      label: "Login with Google",
                      icon: FlutterIcons.google_ant,
                      buttonColor: Colors.white,
                      color: Colors.black,
                      isOutlined: true,
                      onPressed: (){},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 11, 40, 33),
                    child: PrimaryIconButton(
                      label: "Login with Email",
                      icon: Icons.alternate_email_rounded,
                      buttonColor: Colors.black,
                      onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_)=>WelcomeCredentialPage())
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}