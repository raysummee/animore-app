import 'package:animore/ux/components/card/acceptCard.dart';
import 'package:animore/ux/components/complex/profileStatusQuick.dart';
import 'package:animore/ux/components/dialog/animalAbuseDialog.dart';
import 'package:flutter/material.dart';

class MerchantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.cyan,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PopupMenuButton(
                      onSelected: (value){
                        if(value==1){
                          // UniversalAuth().deleteAccount(context);
                        }else if(value==0){
                          showGeneralDialog(
                            context: context, 
                            barrierDismissible: false,
                            transitionDuration: Duration(milliseconds: 200),
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return AnimalAbuseDialog();
                            },
                          );
                        }
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      icon: Icon(Icons.more_vert, color: Colors.white,),
                      itemBuilder: (context){
                        return [
                          PopupMenuItem(child: Text("Report animal abuse"), value: 0,),
                          PopupMenuItem(child: Text("Delete account"), value: 1,)
                        ];
                      }
                    ),
                    ProfileStatusQuick()
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Transform.translate(
                        offset: Offset(0, 70),
                        child: Container(
                          color: Colors.white,
                          child: Container(
                            color: Colors.cyan.withOpacity(0.05),
                            child: StreamBuilder<void>(
                              // stream: Firestore.instance.collection("orders").snapshots(),
                              builder: (context, snapshot) {
                                if(true){
                                  if(true){
                                    return ListView.builder(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 80),
                                      itemBuilder: (context, index) {
                                        return AcceptCard(
                                          null
                                        );
                                      },
                                      itemCount: 5,
                                    );
                                  }else{
                                    return Center(
                                      child: Text("No Booking yet!")
                                    );
                                  }
                                }else{
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }
                            ),
                          )
                        ),
                      ),      
                    ],
                  )
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}