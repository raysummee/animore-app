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
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
                      child: Container(
                        child: SelectableText.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Hi, I'm "
                              ),
                              TextSpan(
                                text: "Angshuman Barpujari ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              TextSpan(
                                text: "developer of the app Animore. I found that taking care of pet is quite difficult when you have more than one pet in your home. They need special care, regular activities: like food, walk, play, etc. This app will help you to manage them. You can create daily weekwise activities for each pet. I will try to provide this app to you free but as costing of server is there in account I hope for some donation. And if any developer want to contribute to this project can contact me"
                              ),
                              TextSpan(
                                text: "\n\nEmail: "
                              ),
                              TextSpan(
                                text: "raysummee@gmail.com",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              TextSpan(
                                text: "\nGithub: "
                              ),
                              TextSpan(
                                text: "github.com/raysummee",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              

                            ]
                          ),
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            height: 1.2,
                            fontSize: 18
                          ),
                        ),
                      )
                    ),
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

