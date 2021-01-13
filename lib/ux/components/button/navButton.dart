import 'package:animore/logic/provider/navBarIndexNotify.dart';
import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final IconData icon;
  final bool active;
  final int index;
  final NavBarIndexNotify notify;
  NavButton(this.icon, this.active, this.index, this.notify);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      child: Stack(      
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: active? Colors.deepOrange : Colors.cyan,
              borderRadius: BorderRadius.circular(15)
            ),
            width: 70,
            height: 70,
            child: IconButton(
              color: Colors.white,
              icon: Icon(icon), 
              onPressed: (){} 
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: ()=>notify.index=index,
                child: Container(
                  height: 70,
                  width: 70,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}