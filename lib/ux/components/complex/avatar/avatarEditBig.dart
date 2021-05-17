import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AvatarEditBig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            constraints: BoxConstraints(
              maxHeight: 200,
              maxWidth: 200
            ),
            width: MediaQuery.of(context).size.width-280,
            height: MediaQuery.of(context).size.width-280,
            child: Image.asset(
              "lib/assets/images/dog_person.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: 200,
              maxWidth: 200
            ),
            width: MediaQuery.of(context).size.width-280,
            height: MediaQuery.of(context).size.width-280,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Icon(
            FlutterIcons.edit_2_fea, 
            color: Colors.white,
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.cyan.withOpacity(0.5),
              onTap: (){},
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: 200,
                  maxWidth: 200
                ),
                width: MediaQuery.of(context).size.width-280,
                height: MediaQuery.of(context).size.width-280,
              ),
            ),
          ),
        ],
      ),
    );
  }
}