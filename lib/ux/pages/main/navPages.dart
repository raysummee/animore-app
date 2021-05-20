import 'package:animore/logic/api/apiImportantEvent.dart';
import 'package:animore/logic/api/apiPet.dart';
import 'package:animore/ux/pages/main/home/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';



class NavPages extends StatefulWidget {
  
  @override
  _NavPagesState createState() => _NavPagesState();
}

class _NavPagesState extends State<NavPages> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) async{
      await ApiPet().all();
      await ApiImportantEvent().all();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return HomeWelcomePage();
  }
}