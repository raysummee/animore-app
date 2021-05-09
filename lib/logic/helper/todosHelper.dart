import 'package:animore/logic/model/modelTodos.dart';
import 'package:animore/logic/util/dateUtil.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class TodosHelper{

  Box<ModelTodos> todayBox(){
    var weekName = DateUtil().todayWeekName();
    return Hive.box<ModelTodos>("Todos_$weekName");
  }

  Future<Box<ModelTodos>> openTodayBox() async{
    var weekName = DateUtil().todayWeekName();
    return await Hive.openBox<ModelTodos>("Todos_$weekName");
  }

  Future<Box<ModelTodos>> openBox(DateTime date) async{
    var weekName = DateUtil().weekName(date);
    return await Hive.openBox<ModelTodos>("Todos_$weekName");
  }

   Box<ModelTodos> boxSyncWeek(String week){
    week = toBeginningOfSentenceCase(week);
    return Hive.box<ModelTodos>("Todos_$week");
  }

  Future<void> closeForceBox(DateTime date) async{
    var weekName = DateUtil().weekName(date);
    bool isOpen = Hive.isBoxOpen("Todos_$weekName");
    if(!isOpen) return;
    await Hive.box<ModelTodos>("Todos_$weekName").close();
  }


  Future<void> safeCloseBox(DateTime date) async{
    var weekName = DateUtil().weekName(date);
    if(weekName==DateUtil().todayWeekName()) return;
    if(weekName==DateUtil().tomorrowWeekName()) return;
    await closeForceBox(date);
  }

  Future<void> retainDefaultBox() async{
    var weekNames = ["mon", "tue", "wed", "thu", "fri", "sat"];
    weekNames.forEach((weekName) async{
      if(weekName==DateUtil().todayWeekName()) return;
      if(weekName==DateUtil().tomorrowWeekName()) return;
      bool isOpen = Hive.isBoxOpen("Todos_$weekName");
      if(!isOpen) return;
      print("closing $weekName");
      await Hive.box<ModelTodos>("Todos_$weekName").close();
    });
  }

  Future<void> openTomorrowBox() async{
    var weekName = DateUtil().tomorrowWeekName();
    await Hive.openBox<ModelTodos>("Todos_$weekName");
  }
 
  Future<void> editTodo(ModelTodos todos, String weekName) async{
    Box<ModelTodos> box = await Hive.openBox<ModelTodos>("Todos_$weekName");
    await box.put(todos.id, todos);
  }


  Future<void> _fetchTodo(Map<String, dynamic> body, String weekName) async{
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
    await _fetchTodo(body, "Mon");
    await _fetchTodo(body, "Tue");
    await _fetchTodo(body, "Wed");
    await _fetchTodo(body, "Thu");
    await _fetchTodo(body, "Fri");
    await _fetchTodo(body, "Sat");
    await _fetchTodo(body, "Sun");
  }
}