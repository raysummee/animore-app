import 'package:animore/logic/helper/petHelper.dart';
import 'package:animore/logic/model/modelTodos.dart';
import 'package:animore/logic/util/dateUtil.dart';
import 'package:animore/main.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class TodosHelper{

  Box<ModelTodos> today(){
    var weekName = DateUtil().todayWeekName();
    return openBox(weekName);
  }

  Future<Box<ModelTodos>> todayFuture() async{
    var weekName = DateUtil().todayWeekName();
    return await openBoxFuture(weekName);
  }

  Future<Box<ModelTodos>> fromDateFuture(DateTime date) async{
    var weekName = DateUtil().weekName(date);
    return await openBoxFuture(weekName);
  }

   Box<ModelTodos> fromWeek(String week){
    week = toBeginningOfSentenceCase(week);
    return openBox(week);
  }

  Future<void> closeFromDate(DateTime date) async{
    var weekName = DateUtil().weekName(date);
    bool isOpen = isBoxOpen(weekName);
    if(!isOpen) return;
    await openBox(weekName).close();
  }

  Future<void> closeAll() async{
    var weekNames = ["mon", "tue", "wed", "thu", "fri", "sat"];
    weekNames.forEach((weekName) async{
      bool isOpen = isBoxOpen(weekName);
      if(!isOpen) return;
      print("closing $weekName");
      await openBox(weekName).close();
    });
  }
 

  Future<void> retainDefault() async{
    var weekNames = ["mon", "tue", "wed", "thu", "fri", "sat"];
    weekNames.forEach((weekName) async{
      if(weekName==DateUtil().todayWeekName()) return;
      if(weekName==DateUtil().tomorrowWeekName()) return;
      bool isOpen = isBoxOpen(weekName);
      if(!isOpen) return;
      print("closing $weekName");
      await openBox(weekName).close();
    });
  }

  Future<Box<ModelTodos>> tomorrowFuture() async{
    var weekName = DateUtil().tomorrowWeekName();
    return await openBoxFuture(weekName);
  }
 
  Future<void> edit(ModelTodos todos, String weekName) async{
    Box<ModelTodos> box = await openBoxFuture(weekName);
    await box.put(todos.id, todos);
  }

  Future<void> add(ModelTodos todos, String weekName) async{
    Box<ModelTodos> box = await openBoxFuture(weekName);
    await box.put(todos.id, todos);
  }

  Future<void> delete(ModelTodos todos, String weekName) async{
    Box<ModelTodos> box = await openBoxFuture(weekName);
    await box.delete(todos.id);
  }


  Future<void> _fetchTodo(Map<String, dynamic> body, String weekName) async{
    Box<ModelTodos> box = await openBoxFuture(weekName);

    if(body['todos'][weekName.toLowerCase()]==null||(body['todos'][weekName.toLowerCase()] as List).isEmpty){
      await box.clear();
      return;
    }

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

  Future<Box<ModelTodos>> openBoxFuture(String weekName) async{
    final petId = PetHelper().selectedId(navigatorKey.currentContext);
    return await Hive.openBox<ModelTodos>("Todos_${weekName}_$petId");
  }

  Box<ModelTodos> openBox(String weekName) {
    final petId = PetHelper().selectedId(navigatorKey.currentContext);
    return Hive.box<ModelTodos>("Todos_${weekName}_$petId");
  }
 
  bool isBoxOpen(String weekName) {
    final petId = PetHelper().selectedId(navigatorKey.currentContext);
    return Hive.isBoxOpen("Todos_${weekName}_$petId");
  }

}