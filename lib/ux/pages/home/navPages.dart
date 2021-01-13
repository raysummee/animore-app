import 'package:animore/logic/provider/navBarIndexNotify.dart';
import 'package:animore/ux/components/button/navButton.dart';
import 'package:animore/ux/pages/home/doctorPage.dart';
import 'package:animore/ux/pages/home/merchantPage.dart';
import 'package:animore/ux/pages/home/shopPage.dart';
import 'package:animore/ux/pages/home/ProfilePage.dart';
import 'package:animore/ux/pages/home/healPage.dart';
import 'package:animore/ux/pages/home/homeWelcomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NavPages extends StatelessWidget {

  final int type;
  NavPages(this.type);
  @override
  Widget build(BuildContext context) {
    var appstate = Provider.of<NavBarIndexNotify>(context);
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(microseconds: 300),
        child: IndexedStack(
          index: appstate.index,          
          children: [
            type==0?HomeWelcomePage():type==1?MerchantPage():DoctorPage(),
            type==1?HomeWelcomePage(type: "merchant",):ShopPage(),
            type==2?HomeWelcomePage(type: "doctor",):HealPage(),
            ProfilePage(type: type==0?"basic":type==1?"merchant":"doctor",)
          ],
        )
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 30,
        child: Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavButton(Icons.home, appstate.index==0, 0, appstate),
              NavButton(type==1? Icons.pets :Icons.shopping_cart, appstate.index==1, 1, appstate),
              NavButton(type==2? Icons.pets :Icons.healing, appstate.index==2, 2, appstate),
              NavButton(Icons.account_circle, appstate.index==3, 3, appstate),
            ],
          ),
        ),
      ),
    );
  }
}