import 'package:animore/logic/api/apiImportantEvent.dart';
import 'package:animore/logic/model/modelImportantEvent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class EventEditListDialog extends StatefulWidget{
  final List<ModelImportantEvent> events;

  EventEditListDialog(this.events);

  static show(BuildContext context, List<ModelImportantEvent> events){
    showDialog(
      context: context, 
      builder: (context) => Dialog(
        child: EventEditListDialog(events)
      )
    );
  }
   @override
  _EventEditListDialogState createState() => _EventEditListDialogState();
}

class _EventEditListDialogState extends State<EventEditListDialog> {
  int pageNo = 0;
  TextEditingController controller;
  List<ModelImportantEvent> events;
  bool nameChange = false;
  bool dateChange = false;
  @override
  void initState() {
    if(widget.events!=null&&widget.events.isNotEmpty){
      events = List.from(widget.events);
    }
    events.add(ModelImportantEvent(dateTime: null, id: null, name: ""));
    controller  = TextEditingController(text: events.elementAt(pageNo).name);
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
              pageNo==events.length-1? "Add Events" :"Edit Events - ${pageNo+1}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              events[pageNo].dateTime==null? "Select Date": DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(events[pageNo].dateTime),
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
                      if(val==events[pageNo].name&&nameChange){
                        setState(() {
                          nameChange = false;
                        });
                      }else if(val!=events[pageNo].name&&!nameChange){
                        setState(() {
                          nameChange = true;
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
                        DateTime temp = await showDatePicker(context: context, initialDate: events[pageNo].dateTime??DateTime.now(), firstDate: DateTime(1990), lastDate: DateTime.now().add(Duration(days: 2000)));
                        if(temp!=null){
                          setState(() {
                            events[pageNo].dateTime = temp;
                            dateChange = true;
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
                  child: AnimatedCrossFade(
                    duration: Duration(milliseconds: 250),
                    crossFadeState: nameChange||dateChange?CrossFadeState.showSecond:CrossFadeState.showFirst,
                    secondChild: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text("Save changes to continue"),
                    ),
                    firstChild:  Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            onPressed: 0<pageNo? (){
                              setState(() {
                                pageNo--;
                                controller.text = events[pageNo].name;
                              });
                            }: null,
                            child: Icon(FlutterIcons.left_ant),
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
                            onPressed: events.length-1>pageNo?(){
                              setState(() {
                                pageNo++;
                                controller.text = events[pageNo].name;
                              });
                            }:null,
                            child: Icon(pageNo>=events.length-2? FlutterIcons.addfile_ant :FlutterIcons.right_ant),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.cyan,
                              minimumSize: Size(400, 50)
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: nameChange||dateChange?() async{
                      events[pageNo].name = controller.text;
                      if(events[pageNo].id!=null){
                        ApiImportantEvent().updateImportantEvent(context, events[pageNo]);
                      }else{
                        ApiImportantEvent().addNewImportantEvent(context, events[pageNo]);
                        widget.events.add(events.last);
                        events.add(ModelImportantEvent(dateTime: null, id: null, name: ""));
                      }
                      setState(() {
                        nameChange = false;
                        dateChange = false;
                      });
                    }:(){
                      Navigator.of(context).pop();
                    },
                    child: Text(nameChange||dateChange?"SAVE":"CLOSE"),
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