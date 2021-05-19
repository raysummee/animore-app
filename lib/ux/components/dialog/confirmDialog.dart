import 'package:animore/logic/errors/infoError.dart';
import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String content;
  final String positiveButtonLabel;
  final String negativeButtonLabel;
  ConfirmDialog(this.title, this.content, this.positiveButtonLabel, this.negativeButtonLabel);

  static Future<bool> show(
    BuildContext context,{
    @required String title, 
    @required String content, 
    @required String positiveButtonLabel, 
    @required String negativeButtonLabel,
    @required VoidCallback postiveButtonFunc,
    @required VoidCallback negativeButtonFunc
    }) async{
    return await showGeneralDialog<bool>(
      context: context, 
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return ConfirmDialog(
          title, 
          content, 
          positiveButtonLabel, 
          negativeButtonLabel
        );
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
                SizedBox(height: 17),
                Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(double.infinity, 48),
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                            )
                          ),
                          onPressed: (){
                            Navigator.of(context).pop(false);
                          }, 
                          child: Text(negativeButtonLabel)
                        ),
                      ),
                      SizedBox(width: 8,),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 48),
                            primary: Colors.cyan.shade600,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                            )
                          ),
                          onPressed: (){
                            Navigator.of(context).pop(true);
                          }, 
                          child: Text(positiveButtonLabel)
                        ),
                      ),
                    ],
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