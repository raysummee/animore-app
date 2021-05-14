import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  final String title;
  final String content;
  final String buttonLabel;
  InfoDialog(this.title, this.content, this.buttonLabel);
  static void show(BuildContext context,{String title, String content, String buttonLabel}){
    showGeneralDialog(
      context: context, 
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return InfoDialog(title, content, buttonLabel);
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
        title: Text(title),
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content,
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
                    child: Text(buttonLabel)
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