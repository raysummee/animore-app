import 'package:animore/ux/components/complex/wave/waveBody.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      body: Container(
        color: Colors.cyan,
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height/2,
              child: Stack(
                children: [
                  WaveBody(size: Size(MediaQuery.of(context).size.width, 100),color: Colors.white,),
                  SafeArea(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "About us",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          "Team Ventricles",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Text(
                        "App Developer: Angshuman Barpujari",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        "Team Leader: Saikat Kamal Haldar",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        "Supporting Team: Hitesh Saha & Anita Koirala",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

