import 'package:animore/ux/components/button/cardButton.dart';
import 'package:animore/ux/components/complex/profileStatusQuick.dart';
import 'package:animore/ux/components/complex/wave/waveBody.dart';
import 'package:animore/ux/pages/main/cartPage.dart';
import 'package:animore/ux/pages/main/contactPage.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String type;
  ProfilePage({this.type:'basic'});
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
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(width: 5, color: Colors.white)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: FutureBuilder<void>(
                              // future: FirebaseAuth.instance.currentUser(),
                              builder: (context, snapshot) {
                                // if(snapshot.hasData){
                                //   return Image(image: CachedNetworkImageProvider(snapshot.data.photoUrl), fit: BoxFit.cover,);
                                // }else{
                                  return Image.asset("lib/assets/images/profile.png", fit: BoxFit.cover,);
                                // }
                              }
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: FutureBuilder<void>(
                            // future: FirebaseAuth.instance.currentUser(),
                            builder: (context, snapshot) {
                              return Text(
                                 "NEW USER",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                                ),
                              );
                            }
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red
                          ),
                          child: Text(
                            type.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200)
                      ),
                      child: CardButton("View Cart", Icons.shopping_cart, Colors.cyan.shade50, (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_)=> CartPage())
                        );
                      })
                    ),
                    CardButton("Contact Us", Icons.unfold_less, Colors.white, (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_)=>ContactPage())
                      );
                    }),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200)
                      ),
                      child: CardButton("Log out", Icons.exit_to_app, Colors.cyan.shade50, () async{
                        // UniversalAuth().logout(context);
                      },)
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}