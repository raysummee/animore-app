import 'package:flutter/material.dart';

class RemoteLogoutDialog extends StatelessWidget {
  static void show(BuildContext context){
    showGeneralDialog(
      context: context, 
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return RemoteLogoutDialog();
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        title: Text("You've been logout!"),
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You're logged out! Please login again to continue the app",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 48),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                    onPressed: (){
                      Navigator.of(context).pop();
                    }, 
                    child: Text("I Understand")
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}