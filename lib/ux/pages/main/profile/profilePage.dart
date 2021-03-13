import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/logic/model/modelUser.dart';
import 'package:animore/ux/components/button/cardButton.dart';
import 'package:animore/ux/components/complex/profileStatusQuick.dart';
import 'package:animore/ux/components/complex/wave/waveBody.dart';
import 'package:animore/ux/pages/main/cartPage.dart';
import 'package:animore/ux/pages/main/profile/contactPage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfilePage extends StatelessWidget {
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
                  ValueListenableBuilder(
                    valueListenable: Hive.box<ModelUser>("user").listenable(),
                    builder: (context, Box box, child) {
                      return Container(
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
                                child: Builder(
                                  builder: (context) {
                                    if(Auth().user()!=null&&Auth().user().image!=null&&Auth().user().image!=""){
                                      return Image(image: NetworkImage(Auth().user().image), fit: BoxFit.cover,);
                                    }else{
                                      return Image.asset("lib/assets/images/profile.png", fit: BoxFit.cover,);
                                    }
                                  }
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Text(
                                  Auth().user()!=null? Auth().user().name.toUpperCase():"",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                                ),
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
                                Auth().user()!=null?Auth().user().role.toUpperCase():"",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
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
                        await Auth().logout(context);
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