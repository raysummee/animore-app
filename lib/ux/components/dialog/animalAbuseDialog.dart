import 'package:animore/ux/components/button/mediumButton.dart';
import 'package:flutter/material.dart';

class AnimalAbuseDialog extends StatefulWidget {
  @override
  _AnimalAbuseDialogState createState() => _AnimalAbuseDialogState();
}

class _AnimalAbuseDialogState extends State<AnimalAbuseDialog> {
  String name;
  String location;
  String whatHappened;
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Animal Abuse portal",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Your name",
                  filled: true
                ),
                onChanged: (value){
                  name = value;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Location",
                  filled: true
                ),
                onChanged: (value){
                  location = value;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "What happened",
                  filled: true
                ),
                onChanged: (value){
                  whatHappened = value;
                },
                maxLines: 10,
              ),
            ),
            Builder(
              builder:(context)=> MediumButton( () async{
                setState(() {
                  isLoading = true;
                });
                if(name!=null&&name!=''&&location!=null&&location!=""&&whatHappened!=null&&whatHappened!="")
                {
                  
                  Navigator.of(context).pop();
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("Submitted!"))
                  );
                }     
                setState(() {
                  isLoading = false;
                });
              },name: "Submit", isLoading: isLoading,),
            )
          ],
        ),
      )
    );
  }
}