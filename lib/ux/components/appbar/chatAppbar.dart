import 'package:animore/ux/components/others/customCircleAvatar.dart';
import 'package:flutter/material.dart';

class ChatAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String recepient;
  final String recepientImage;
  ChatAppbar(this.recepient, this.recepientImage);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 2.0,spreadRadius: 2)]
      ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(5,5,5,10),
      child: SafeArea(
        child: Row(
          children: [
            BackButton(
              color: Colors.black,
            ),
            GestureDetector(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: CustomCircleAvatar(
                  image: NetworkImage(recepientImage),
                  fallbackString: recepient[0].toUpperCase(),
                )
              ),
              onTap: (){},
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    recepient,
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  SizedBox(height: 8,),
                  Text("online")
                ],
              )
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}