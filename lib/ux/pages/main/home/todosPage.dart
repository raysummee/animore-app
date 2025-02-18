
import 'package:animore/logic/api/apiTodos.dart';
import 'package:animore/logic/model/modelTodos.dart';
import 'package:animore/logic/provider/petSelectNotify.dart';
import 'package:animore/logic/util/dateUtil.dart';
import 'package:animore/ux/components/card/todoCard.dart';
import 'package:animore/ux/pages/main/pets/editPetTodosPage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class TodosPage extends StatefulWidget {
  final ScrollController controller;
  TodosPage(this.controller);

  @override
  _TodosPageState createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  Future fetchFromApi;
  @override
  void initState() {
    fetchFromApi = ApiTodos().all();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PetSelectNotify>(context);
    return Container(
      width: double.infinity,
      color: Colors.cyan.withOpacity(0.03),
      child: FutureBuilder<void>(
        future: fetchFromApi,
        builder: (context, snapshot) {
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 800,
              ),
              width: MediaQuery.of(context).size.width,
              child: Hive.isBoxOpen("Todos_${DateUtil().todayWeekName()}_${provider.id}")? ValueListenableBuilder(
                valueListenable: Hive.box<ModelTodos>("Todos_${DateUtil().todayWeekName()}_${provider.id}").listenable(), 
                builder: (context, Box<ModelTodos> box, child) {
                  if(box.isNotEmpty){
                    return ListView.separated(
                      padding: EdgeInsets.fromLTRB(0, 110, 0, 150),
                      controller: widget.controller,
                      itemBuilder: (context, index) => TodoCard(box.getAt(index), index), 
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
                              "No Todos Added! Add some by clicking on it"
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
                            onPressed: (){
                                EditPetTodosPage.showBottomSheet(context);
                            }, 
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
              ):Center(
                child: CircularProgressIndicator()
              ),
            ),
          );
        }
      ),
    );
  }
}