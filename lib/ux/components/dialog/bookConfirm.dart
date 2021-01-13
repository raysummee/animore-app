import 'package:animore/logic/model/modelDoctor.dart';
import 'package:flutter/material.dart';

class BookConfirm extends StatefulWidget {
  final ModelDoctor modelDoctor;
  BookConfirm(this.modelDoctor);
  @override
  _BookConfirmState createState() => _BookConfirmState();
}

class _BookConfirmState extends State<BookConfirm> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Do you really want to book the appointment? A notification will be sent to the doctor. As soon as he accept you will be notified"
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16,8,0),
                      child: ButtonTheme(
                        buttonColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        child: OutlineButton(
                          onPressed: isLoading? (){} :()=>Navigator.of(context).pop(),
                          child: Text("Cancel"),
                        ),
                      ),
                    ),
                    Builder(
                      builder: (context)=> Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16,0,0),
                        child: ButtonTheme(
                          buttonColor: Colors.green,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          child: RaisedButton(
                            onPressed: isLoading? (){}: () async{
                              setState(() {
                                isLoading = true;
                              });
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.of(context).pop();
                              Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text("Successfully booked"))
                              );
                            },
                            child: !isLoading? Text(
                              "Book",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ):
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              )
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              )
            ],
          )
        ),
      ),
    );
  }
}