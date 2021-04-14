import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/logic/Helper/authenticationHelper.dart';
import 'package:animore/logic/enum/roleEnum.dart';
import 'package:flutter/material.dart';

class ProfileStatusQuick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                child: FittedBox(
                  child: Text(
                    "${Auth().user().name.toUpperCase()}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 4, 0, 0),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red
                ),
                child: Text(
                  roleEnumToString(Auth().user().role).toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white, width: 3)
            ),
            width: 50,
            height: 50,
            child: Builder(
              builder: (context) {
                if(Auth().user().image!=null&&Auth().user().image!=""){
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.white,
                      child: Image(image: NetworkImage(Auth().user().image), fit: BoxFit.cover,)
                    )
                  );
                }else{
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("lib/assets/images/profile.png", fit: BoxFit.cover,)
                  );
                }
              }
            ),
          )
        ],
      ),
    );
  }
}