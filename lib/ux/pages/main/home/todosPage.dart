import 'package:animore/logic/api/apiTodos.dart';
import 'package:animore/logic/helper/todosHelper.dart';
import 'package:animore/logic/model/modelTodos.dart';
import 'package:animore/ux/components/card/todoCard.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodosPage extends StatelessWidget {
  final ScrollController controller;
  TodosPage(this.controller);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan.withOpacity(0.05),
      child: FutureBuilder<void>(
        future: ApiTodos().getTodosAllRequest(),
        builder: (context, snapshot) {
          return ValueListenableBuilder(
            valueListenable: TodosHelper().getTodayWeekTodosBox().listenable(), 
            builder: (context, Box<ModelTodos> box, child) {
              if(box.isNotEmpty){
                return ListView.separated(
                  padding: EdgeInsets.fromLTRB(0, 110, 0, 150),
                  controller: controller,
                  itemBuilder: (context, index) => TodoCard(box.getAt(index)), 
                  separatorBuilder: (context, index) {
                    return Divider(
                      indent: 30,
                      height: 1,
                      color: Colors.cyan,
                      endIndent: 30,
                    );
                  }, 
                  itemCount: box.length
                );
              }else if(snapshot.connectionState!=ConnectionState.done){
                return Center(
                  child: CircularProgressIndicator()
                );
              }else{
                return Center(
                  child: Text(
                    "No Todos Added! Add some by click on it"
                  ),
                );
              }
            }
          );
        }
      ),
    );
  }
}