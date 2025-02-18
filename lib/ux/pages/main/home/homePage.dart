import 'package:animore/ux/components/complex/profileStatusQuick.dart';
import 'package:animore/ux/components/others/todayWeekCalender.dart';
import 'package:animore/ux/pages/main/home/petHome.dart';
import 'package:animore/ux/pages/main/home/todosPage.dart';
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TodayWeekCalender(),
                        SizedBox(width: 32,),
                        Expanded(child: ProfileStatusQuick())
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
                              child: TodosPage(controller),
                            ),
                          ),
                          PetHome()
                        ],
                      )
                    ),
                  ),
                ],
              ),
            )
          ),
          // AppearingFromBottomWidget(showOverViewButton, EditTodoButton())
        ],
      ),
    );
  }
}