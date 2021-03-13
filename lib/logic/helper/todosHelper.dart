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
 
  Future<void> editTodoByWeekName(ModelTodos todos, String weekName, int index) async{
    Box<ModelTodos> box = await Hive.openBox<ModelTodos>("Todos_$weekName");
    await box.put(index, todos);
  }


  Future<void> fetchTodos(Map<String, dynamic> body) async{

    //monday//

    Box<ModelTodos> box = await Hive.openBox<ModelTodos>("Todos_Mon");
    List<ModelTodos> todos = (body['todos']['mon'] as List).map((e) => ModelTodos.fromMap(e)).toList();
    todos.forEach((newTodo) {
      if(box.containsKey(newTodo.id)){
        newTodo.done = box.get(newTodo.id).done;
      }
    });
    todos.sort((a,b)=>a.time.compareTo(b.time));
    await box.clear();
    await box.addAll(todos);

    //tuesday//

    box = await Hive.openBox<ModelTodos>("Todos_Tue");
    todos = (body['todos']['tues'] as List).map((e) => ModelTodos.fromMap(e)).toList();
    todos.forEach((newTodo) {
      if(box.containsKey(newTodo.id)){
        newTodo.done = box.get(newTodo.id).done;
      }
    });
    todos.sort((a,b)=>a.time.compareTo(b.time));
    await box.clear();
    await box.addAll(todos);

    //wednesday//

    box = await Hive.openBox<ModelTodos>("Todos_Wed");
    todos = (body['todos']['wed'] as List).map((e) => ModelTodos.fromMap(e)).toList();
    todos.forEach((newTodo) {
      if(box.containsKey(newTodo.id)){
        newTodo.done = box.get(newTodo.id).done;
      }
    });
    todos.sort((a,b)=>a.time.compareTo(b.time));
    await box.clear();
    await box.addAll(todos);


    //thursday//

    box = await Hive.openBox<ModelTodos>("Todos_Thu");
    todos = (body['todos']['thus'] as List).map((e) => ModelTodos.fromMap(e)).toList();
    todos.forEach((newTodo) {
      if(box.containsKey(newTodo.id)){
        newTodo.done = box.get(newTodo.id).done;
      }
    });
    todos.sort((a,b)=>a.time.compareTo(b.time));
    await box.clear();
    await box.addAll(todos);

    //friday//

    box = await Hive.openBox<ModelTodos>("Todos_Fri");
    todos = (body['todos']['fri'] as List).map((e) => ModelTodos.fromMap(e)).toList();
    todos.forEach((newTodo) {
      if(box.containsKey(newTodo.id)){
        newTodo.done = box.get(newTodo.id).done;
      }
    });
    todos.sort((a,b)=>a.time.compareTo(b.time));
    await box.clear();
    await box.addAll(todos);

    //saturday

    box = await Hive.openBox<ModelTodos>("Todos_Sat");
    todos = (body['todos']['sat'] as List).map((e) => ModelTodos.fromMap(e)).toList();
    todos.forEach((newTodo) {
      if(box.containsKey(newTodo.id)){
        newTodo.done = box.get(newTodo.id).done;
      }
    });
    todos.sort((a,b)=>a.time.compareTo(b.time));
    await box.clear();
    await box.addAll(todos);

    //sunday//

    box = await Hive.openBox<ModelTodos>("Todos_Sun");
    todos = (body['todos']['sun'] as List).map((e) => ModelTodos.fromMap(e)).toList();
    todos.forEach((newTodo) {
      if(box.containsKey(newTodo.id)){
        newTodo.done = box.get(newTodo.id).done;
      }
    });
    todos.sort((a,b)=>a.time.compareTo(b.time));
    await box.clear();
    await box.addAll(todos);
  }
}