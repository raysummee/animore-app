import 'package:animore/logic/auth/universalAuth.dart';
import 'package:animore/logic/db/dbTodos.dart';
import 'package:animore/logic/model/modelTodos.dart';
import 'package:animore/ux/components/card/petCard.dart';
import 'package:animore/ux/components/card/todoCard.dart';
import 'package:animore/ux/components/complex/profileStatusQuick.dart';
import 'package:animore/ux/components/dialog/animalAbuseDialog.dart';
import 'package:flutter/material.dart';

class HomeWelcomePage extends StatefulWidget {
  final String type;
  HomeWelcomePage({this.type:"basic"});

  @override
  _HomeWelcomePageState createState() => _HomeWelcomePageState();
}

class _HomeWelcomePageState extends State<HomeWelcomePage> {
  ScrollController controller;
  bool showOverViewButton = false;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(scrollListener);
  }

  scrollListener(){
    if(controller.offset >= controller.position.maxScrollExtent-30){
      setState(() {
        showOverViewButton = true;
      });
    }else{
      setState(() {
        showOverViewButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   child: Icon(Icons.help),
      //   backgroundColor: Colors.deepOrange,
      // ),
      body: Stack(
        children: [
          Container(
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
                              UniversalAuth().deleteAccount(context);
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
                        ProfileStatusQuick(
                          type: widget.type,
                        )
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
                                child: FutureBuilder<List<ModelTodos>>(
                                  future: DbTodos().getTodos(),
                                  builder: (context, snapshot) {
                                    if(snapshot.data!=null){
                                      if(snapshot.data.isNotEmpty){
                                        return ListView.separated(
                                          padding: EdgeInsets.fromLTRB(0, 110, 0, 150),
                                          controller: controller,
                                          itemBuilder: (context, index) => TodoCard(snapshot.data.elementAt(index)), 
                                          separatorBuilder: (context, index) {
                                            return Divider(
                                              indent: 30,
                                              height: 1,
                                              color: Colors.cyan,
                                              endIndent: 30,
                                            );
                                          }, 
                                          itemCount: snapshot.data.length
                                        );
                                      }else{
                                        return Center(
                                          child: Text(
                                            "No Todos Added! Add some by click on it"
                                          ),
                                        );
                                      }
                                    }else{
                                      return Center(
                                        child: CircularProgressIndicator()
                                      );
                                    }
                                  }
                                ),
                              )
                            ),
                          ),
                          FutureBuilder<void>(
                            // future: FirebaseAuth.instance.currentUser(),
                            builder: (context, snapshotUser) {
                              if(true){
                                return StreamBuilder<void>(
                                  // stream: Firestore.instance.collection("userInfo").where("uid", isEqualTo: snapshotUser.data.uid).limit(1).snapshots(),
                                  builder: (context, snapshot) {
                                    return PetCard(
                                      "Pet",
                                          DateTime(
                                            DateTime.now().year,
                                            10, 
                                            10
                                          ).isBefore(DateTime.now())?
                                            DateTime(
                                              DateTime.now().year+1,
                                              10,
                                              10
                                             )
                                            :null
                                            
                                    );
                                  }
                                );
                              }else{
                                return PetCard(
                                  "Pet",
                                  null, 
                                );
                              }
                            }
                          ),
                        ],
                      )
                    ),
                  ),
                ],
              ),
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              transform: showOverViewButton? Matrix4.translationValues(0, 0, 0) :Matrix4.translationValues(0, 80, 0),
              child: Container(
                margin: EdgeInsets.fromLTRB(80, 0, 80, 8),
                child: Material(
                  color: Colors.cyan.shade100,
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    onTap: (){},
                    splashColor: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit, color: Colors.black54,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:8.0),
                            child: Text(
                              "Edit Todos",
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}