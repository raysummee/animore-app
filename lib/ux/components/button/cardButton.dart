import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData leading;
  final Color color;
  final VoidCallback onClick;
  CardButton(this.title, this.leading, this.color, this.onClick, {this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: color,
          child: ListTile(
            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            leading: Icon(leading,size: 30, color: Colors.cyan),
            title: Text(title),
            subtitle: subtitle!=null?Text(subtitle):null,
            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.cyan.shade300,),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onClick,
            child: Container(
              width: double.infinity,
              height: 72,
            ),
          ),
        )
      ],
    );
  }
}