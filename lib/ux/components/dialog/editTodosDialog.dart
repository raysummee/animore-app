import 'package:animore/logic/api/apiImportantEvent.dart';
import 'package:animore/logic/api/apiTodos.dart';
import 'package:animore/logic/model/modelImportantEvent.dart';
import 'package:animore/logic/model/modelTodos.dart';
import 'package:animore/logic/util/dateUtil.dart';
import 'package:animore/ux/components/loader/indeterminateLoader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class EditTodosDialog extends StatefulWidget{
  final ModelTodos todo;
  final int index;
  final String weekName;
  EditTodosDialog(this.todo, this.index, this.weekName);

  static show(BuildContext context, {ModelTodos todo, int index, String weekName}){
    showDialog(
      context: context, 
      builder: (context) => Dialog(
        child: EditTodosDialog(todo, index, weekName)
      )
    );
  }
   @override
  _EditTodosDialogState createState() => _EditTodosDialogState();
}

class _EditTodosDialogState extends State<EditTodosDialog> {
  TextEditingController controller;
  ModelTodos todo;

  bool change = false;
  @override
  void initState() {
    
    if(widget.todo==null){
      todo = ModelTodos(
        id: null, 
        name: "", 
        time: null, 
        done: 0
      );
    }else{
      todo = ModelTodos(
        id: widget.todo.id, 
        name: widget.todo.name, 
        time: widget.todo.time, 
        done: widget.todo.done
      );
    }
    controller  = TextEditingController(text: todo.name);

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
              "Add Todo",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              todo.time==null? 
                "Select Time": 
                DateFormat(DateFormat.HOUR_MINUTE).format(todo.time),
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
                      if(val==todo.name&&change){
                        setState(() {
                          change = false;
                        });
                      }else if(val!=todo.name&&!change){
                        setState(() {
                          change = true;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      hintText: "Todos",
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
                        TimeOfDay timeInitial;

                        if(todo.time!=null)
                          timeInitial = TimeOfDay.fromDateTime(todo.time);
                        else
                          timeInitial = TimeOfDay.now();

                        TimeOfDay t = await showTimePicker(context: context, initialTime: timeInitial);
                        if(t==null) return;
                        DateTime dateTime = DateUtil().toDateTime(t);
                        setState(() {
                          todo.time = dateTime;
                          change = true;
                        });
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
                            onPressed: widget.todo==null?null:() async{
                              IndeterminateLoader.show(context);
                              bool status = await ApiTodos().delete(todo, widget.weekName);
                              IndeterminateLoader.hide();
                              if(status)
                              Navigator.of(context).pop();
                            },
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
                    onPressed: change&&todo.time!=null&&controller.text.isNotEmpty?() async{
                      todo.name = controller.text;
                      if(todo.id!=null){
                        IndeterminateLoader.show(context);
                        await ApiTodos().update(todo, widget.weekName, todo.id);
                        IndeterminateLoader.hide();
                      }else{
                        IndeterminateLoader.show(context);
                        await ApiTodos().addNew(todo, widget.weekName);
                        IndeterminateLoader.hide();
                      }
                      Navigator.of(context).pop();
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