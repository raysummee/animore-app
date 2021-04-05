import 'package:animore/logic/model/modelImportantEvent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EventEditListDialog {
  static show(BuildContext context){
    showDialog(
      context: context, 
      builder: (context) => Dialog(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Edit Events",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 200,
                child: ValueListenableBuilder(
                  valueListenable: Hive.box<ModelImportantEvent>("importantEvent").listenable(),
                  builder: (context, Box<ModelImportantEvent> box , snapshot) {
                    return ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
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
                                  onPressed: (){
                                  }
                                )
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}