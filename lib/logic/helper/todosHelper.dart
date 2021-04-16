import 'package:animore/logic/model/modelTodos.dart';
import 'package:animore/logic/util/dateUtil.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class TodosHelper{

  Box<ModelTodos> getTodayWeekTodosBox(){
    var weekName = DateUtil().getTodayWeekName();
    return Hive.box<ModelTodos>("Todos_$weekName");
  }

  Future<void> openTodayWeekTodosBox() async{
    var weekName = DateUtil().getTodayWeekName();
    await Hive.openBox<ModelTodos>("Todos_$weekName");
  }

  Future<void> openTomorrowWeekTodosBox() async{
    var weekName = DateUtil().getTomorrowWeekName();
    await Hive.openBox<ModelTodos>("Todos_$weekName");
  }
 
  Future<void> editTodoByWeekName(ModelTodos todos, String weekName) async{
    Box<ModelTodos> box = await Hive.openBox<ModelTodos>("Todos_$weekName");
    await box.put(todos.id, todos);
  }


  Future<void> fetchTodosWeekwise(Map<String, dynamic> body, String weekName) async{
    Box<ModelTodos> box = await Hive.openBox<ModelTodos>("Todos_$weekName");

    if(body['todos'][weekName.toLowerCase()]==null||(body['todos'][weekName.toLowerCase()] as List).isEmpty) return;

    List<ModelTodos> todos = (body['todos'][weekName.toLowerCase()] as List).map((e) => ModelTodos.fromMap(e)).toList();
    todos.sort((a,b)=>a.time.compareTo(b.time));

    Map<int, ModelTodos> todosMap = Map();
    todos.forEach((newTodo) {
      if(box.containsKey(newTodo.id)){
        newTodo.done = box.get(newTodo.id).done;
      }else{
        newTodo.done = 0;
      }
      todosMap.putIfAbsent(newTodo.id, () => newTodo);
    });

    await box.clear();
    await box.putAll(todosMap);
  }

  Future<void> fetchTodos(Map<String, dynamic> body) async{
    await fetchTodosWeekwise(body, "Mon");
    await fetchTodosWeekwise(body, "Tue");
    await fetchTodosWeekwise(body, "Wed");
    await fetchTodosWeekwise(body, "Thu");
    await fetchTodosWeekwise(body, "Fri");
    await fetchTodosWeekwise(body, "Sat");
    await fetchTodosWeekwise(body, "Sun");
  }
}