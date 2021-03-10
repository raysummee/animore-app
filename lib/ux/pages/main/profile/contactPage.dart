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
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                            child: Icon(Icons.arrow_back_ios, color: Colors.white),
                          )
                        ), 
                      ),
                    ),
                  ),
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
                  child: Container()
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

