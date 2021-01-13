import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileStatusQuick extends StatelessWidget {
  final String type;
  ProfileStatusQuick({this.type:"basic"});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FutureBuilder<void>(
                // future: FirebaseAuth.instance.currentUser(),
                builder: (context, snapshot) {
                  return Text(
                    // snapshot.data!=null&&snapshot.data.displayName!=null?
                    // snapshot.data.displayName.split(" ").elementAt(0).toUpperCase():
                    "USER",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  );
                }
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 4, 0, 0),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red
                ),
                child: Text(
                  type.toUpperCase(),
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
            child: FutureBuilder<void>(
              // future: FirebaseAuth.instance.currentUser(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.white,
                      // child: Image(image: CachedNetworkImageProvider(snapshot.data.photoUrl), fit: BoxFit.cover,)
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