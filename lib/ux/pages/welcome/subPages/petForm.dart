import 'package:animore/logic/auth/googleAuth.dart';
import 'package:animore/logic/db/dbTodos.dart';
import 'package:animore/logic/model/modelPet.dart';
import 'package:animore/logic/model/modelTodos.dart';
import 'package:animore/ux/components/button/wideRoundedButton.dart';
import 'package:animore/ux/pages/home/navPages.dart';
import 'package:flutter/material.dart';

class PetForm extends StatefulWidget {
  @override
  _PetFormState createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  DateTime vaccineDate;
  String petName;
  String age;
  String phoneNo;
  bool isLoadingSignup = false;
  bool isLoadingLogin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xff00D2E1),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Text(
                  "Tell us about your pet",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Pet Name"
                    ),
                    onChanged: (value){
                      petName = value;
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Phone No."
                    ),
                    keyboardType: TextInputType.phone,
                    onChanged: (value){
                      phoneNo = value;
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 8, 20, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Age"
                          ),
                          keyboardType: TextInputType.numberWithOptions(decimal: false,signed: false),
                          onChanged: (value){
                            age = value;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: ButtonTheme(
                        buttonColor: Colors.white,
                        minWidth: 120,
                        height: 50,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: FlatButton(
                          onPressed: () async{
                            DateTime dateTime = await showDatePicker(
                              context: context, 
                              initialDate: DateTime.now(), 
                              firstDate: DateTime(1990), 
                              lastDate: DateTime.now(),
                            );
                            if(dateTime!=null){
                              setState(() {
                                vaccineDate = dateTime;
                              });
                            }
                          },
                          color: Colors.white,
                          child: Text(
                            vaccineDate!=null? "${vaccineDate.year}-${vaccineDate.month}-${vaccineDate.day}" :"Vaccine Date",
                            style: TextStyle(
                              color: Colors.grey.shade600
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ),
              Builder(
                builder:(context)=> Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: WideRoundedButton(
                    "Sign Up", 
                    () async{  
                      if(petName!=null&&petName!=""&&phoneNo!=null&&phoneNo!=""&&age!=null&&age!=""&&vaccineDate!=null){
                        setState(() {
                          isLoadingSignup = true;
                        });
                        if(true){
                          if(true){
                            
                            List<ModelTodos> todos = await DbTodos().getTodos();
                            if(todos==null||todos.isEmpty){
                              await DbTodos().insertTodos(
                                ModelTodos(id: 1, removable: false, done: 0, imageLeading: "lib/assets/images/dog_food.png", sub: "Food at 10AM", name: "Food")
                              );
                              await DbTodos().insertTodos(
                                ModelTodos(id: 2, removable: false, done: 0, imageLeading: "lib/assets/images/dog_bone.png", sub: "Play at 12PM", name: "Play")
                              );
                              await DbTodos().insertTodos(
                                ModelTodos(id: 3, removable: false, done: 0, imageLeading: "lib/assets/images/dog_bath.png", sub: "Bath at 2PM", name: "Bath")
                              );
                              await DbTodos().insertTodos(
                                ModelTodos(id: 4, removable: false, done: 0, imageLeading: "lib/assets/images/dog_food.png", sub: "Food at 3PM", name: "Food")
                              );
                              await DbTodos().insertTodos(
                                ModelTodos(id: 5, removable: false, done: 0, imageLeading: "lib/assets/images/dog_bone.png", sub: "Play at 5PM", name: "Play")
                              );
                              await DbTodos().insertTodos(
                                ModelTodos(id: 6,removable: false, done: 0, imageLeading: "lib/assets/images/dog_food.png", sub: "Food at 9PM", name: "Food")
                              );
                            } 
                            
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (_)=>NavPages(
                                0
                              )),
                              (route) => false
                            );
                          }
                        }
                        setState(() {
                          isLoadingSignup = false;
                        });
                      }else{
                        Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("A account is already there!"))
                        );
                      }
                    },
                    isLoading: isLoadingSignup,
                  )
                ),
              ),
              Builder(
                builder: (context)=> Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: WideRoundedButton(
                    "Log In", 
                    () async{  
                      if(true){
                        setState(() {
                          isLoadingLogin = true;
                        });
                        if(true){
                          if(true){
                            List<ModelTodos> todos = await DbTodos().getTodos();
                            if(todos==null||todos.isEmpty){
                              await DbTodos().insertTodos(
                                ModelTodos(id: 1, removable: false, done: 0, imageLeading: "lib/assets/images/dog_food.png", sub: "Food at 10AM", name: "Food")
                              );
                              await DbTodos().insertTodos(
                                ModelTodos(id: 2, removable: false, done: 0, imageLeading: "lib/assets/images/dog_bone.png", sub: "Play at 12PM", name: "Play")
                              );
                              await DbTodos().insertTodos(
                                ModelTodos(id: 3, removable: false, done: 0, imageLeading: "lib/assets/images/dog_bath.png", sub: "Bath at 2PM", name: "Bath")
                              );
                              await DbTodos().insertTodos(
                                ModelTodos(id: 4, removable: false, done: 0, imageLeading: "lib/assets/images/dog_food.png", sub: "Food at 3PM", name: "Food")
                              );
                              await DbTodos().insertTodos(
                                ModelTodos(id: 5, removable: false, done: 0, imageLeading: "lib/assets/images/dog_bone.png", sub: "Play at 5PM", name: "Play")
                              );
                              await DbTodos().insertTodos(
                                ModelTodos(id: 6,removable: false, done: 0, imageLeading: "lib/assets/images/dog_food.png", sub: "Food at 9PM", name: "Food")
                              );
                            } 
                            
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (_)=>NavPages(0)),
                              (route) => false
                            );
                          }else{
                            Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text("No account found!"))
                            );
                          }
                        }
                        setState(() {
                          isLoadingLogin = false;
                        });
                      }
                    },
                    isLoading: isLoadingLogin,
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}