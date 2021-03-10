import 'package:animore/logic/provider/navBarIndexNotify.dart';
import 'package:animore/ux/components/button/navButton.dart';
import 'package:animore/ux/pages/main/doctorPage.dart';
import 'package:animore/ux/pages/main/merchantPage.dart';
import 'package:animore/ux/pages/main/shopPage.dart';
import 'package:animore/ux/pages/main/profile/profilePage.dart';
import 'package:animore/ux/pages/main/healPage.dart';
import 'package:animore/ux/pages/main/home/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NavPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appstate = Provider.of<NavBarIndexNotify>(context);
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(microseconds: 300),
        child: IndexedStack(
          index: appstate.index,          
          children: [
            HomeWelcomePage(),
            // ShopPage(),
            // HealPage(),
            Container(),
            Container(),
            ProfilePage()

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
              NavButton(Icons.shopping_cart, appstate.index==1, 1, appstate),
              NavButton(Icons.healing, appstate.index==2, 2, appstate),
              NavButton(Icons.account_circle, appstate.index==3, 3, appstate),
            ],
          ),
        ),
      ),
    );
  }
}