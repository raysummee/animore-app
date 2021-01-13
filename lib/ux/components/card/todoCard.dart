import 'package:animore/logic/db/dbTodos.dart';
import 'package:animore/logic/model/modelTodos.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  final ModelTodos modelTodos;
  TodoCard(this.modelTodos);
  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool selected = false;

  @override
  void initState() {
    super.initState();
    selected = widget.modelTodos.done==DateTime.now().day;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      width: double.infinity,
      alignment: Alignment.center,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(
                image: AssetImage(widget.modelTodos.imageLeading),
                height: 60,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 0, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                      child: Text(
                        widget.modelTodos.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                        ),
                      ),
                    ),
                    Text(
                      widget.modelTodos.sub,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey.shade500
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          InkWell(
          onTap: () {
            setState(() {
              selected = !selected;
              DbTodos().insertTodos(
                ModelTodos(
                  id: widget.modelTodos.id, 
                  done: selected?DateTime.now().day:0, 
                  imageLeading: widget.modelTodos.imageLeading, 
                  sub: widget.modelTodos.sub, 
                  name: widget.modelTodos.name, 
                  removable: widget.modelTodos.removable
                )
              );
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(
                shape: BoxShape.circle, 
                border: Border.all(color: Colors.cyan),
                color: selected? Colors.cyan : Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: selected
                  ?Icon(
                    Icons.check,
                    size: 10.0,
                    color: Colors.white,
                  )
                  :Container(
                    width: 10,
                    height: 10,
                  )
                ),
              ),
          )
          )
        ],
      )
    );
  }
}