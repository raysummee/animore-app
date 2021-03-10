import 'package:animore/logic/api/apiTodos.dart';
import 'package:animore/logic/helper/todosHelper.dart';
import 'package:animore/logic/model/modelTodos.dart';
import 'package:animore/ux/components/button/MediumRoundedButton.dart';
import 'package:animore/ux/components/button/editTodoButton.dart';
import 'package:animore/ux/components/button/mediumButton.dart';
import 'package:animore/ux/components/button/ovalBigButton.dart';
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
      color: Colors.cyan.withOpacity(0.03),
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "No Todos Added! Add some by click on it"
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: Size(50, 50),
                        ),
                        onPressed: (){}, 
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.today_outlined),
                            Icon(Icons.add),
                          ],
                        )
                      )
                    ],
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