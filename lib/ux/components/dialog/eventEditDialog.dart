import 'package:animore/logic/api/apiImportantEvent.dart';
import 'package:animore/logic/model/modelImportantEvent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class EventEditDialog extends StatefulWidget{
  final ModelImportantEvent event;

  EventEditDialog(this.event);

  static show(BuildContext context, {ModelImportantEvent event}){
    showDialog(
      context: context, 
      builder: (context) => Dialog(
        child: EventEditDialog(event)
      )
    );
  }
   @override
  _EventEditDialogState createState() => _EventEditDialogState();
}

class _EventEditDialogState extends State<EventEditDialog> {
  TextEditingController controller;
  ModelImportantEvent event;

  bool change = false;
  @override
  void initState() {
    
    if(widget.event==null){
      event = ModelImportantEvent(dateTime: null, id: 0, name: "");
    }else{
      event = widget.event;
    }
    controller  = TextEditingController(text: event.name);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 22, 16, 16),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Events",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              event.dateTime==null? 
                "Select Date": 
                DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(event.dateTime),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    onChanged: (val){
                      if(val==event.name&&change){
                        setState(() {
                          change = false;
                        });
                      }else if(val!=event.name&&!change){
                        setState(() {
                          change = true;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      hintText: "Event",
                    ),
                  )
                ),
                SizedBox(
                  width: 12,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Material(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.cyan,
                    child: IconButton(
                      padding: EdgeInsets.all(13),
                      splashColor: Colors.deepOrange,
                      icon: Icon(FlutterIcons.date_range_mdi, color: Colors.white), 
                      onPressed: () async{
                        DateTime temp = await showDatePicker(context: context, initialDate: event.dateTime??DateTime.now(), firstDate: DateTime(1990), lastDate: DateTime.now().add(Duration(days: 2000)));
                        if(temp!=null){
                          setState(() {
                            event.dateTime = temp;
                            change = true;
                          });
                        }
                      }
                    )
                  ),
                ),
              ] 
            ),
            SizedBox(
              height: 22,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Icon(FlutterIcons.back_ant),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.cyan,
                              minimumSize: Size(400, 50)
                            ),
                          )
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            onPressed: widget.event==null?null:(){},
                            child: Icon(FlutterIcons.trash_fea),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.cyan,
                              minimumSize: Size(400, 50)
                            ),
                          )
                        ),
                      ],
                    )
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: change&&event.dateTime!=null&&controller.text.isNotEmpty?() async{
                      // events[pageNo].name = controller.text;
                      // if(events[pageNo].id!=null){
                      //   ApiImportantEvent().updateImportantEvent(events[pageNo]);
                      // }else{
                      //   ApiImportantEvent().addNewImportantEvent(events[pageNo]);
                      //   events.add(events.last);
                      //   events.add(ModelImportantEvent(dateTime: null, id: null, name: ""));
                      // }
                    }:null,
                    child: Text("SAVE"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan,
                      minimumSize: Size(400, 50)
                    ),
                  )
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}