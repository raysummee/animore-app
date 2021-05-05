import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/logic/model/modelMessage.dart';
import 'package:animore/logic/model/modelVetBook.dart';
import 'package:animore/ux/components/appbar/chatAppbar.dart';
import 'package:animore/ux/components/group/chatInputGroup.dart';
import 'package:animore/ux/components/others/customCircleAvatar.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class MessageDoctorPage extends StatelessWidget {
  final ModelVetBook vetBook;
  MessageDoctorPage(this.vetBook);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppbar(
        vetBook.user.name,
        vetBook.user.image
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.6), BlendMode.color),
                  image: AssetImage("lib/assets/images/chatBGCyan.png"),
                )
              ),
              child: ValueListenableBuilder(
                valueListenable: Hive.box<ModelMessage>("messages").listenable(),
                builder: (context, Box<ModelMessage> box, child) {
                  return ListView.builder(
                    padding: EdgeInsets.fromLTRB(22, 16, 22, 16),
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      return message(index, box.getAt(index), index==0?box.getAt(index-1):null);
                    }
                  );
                }
              ),
            ) 
          ),
          ChatInputGroup()
        ],
      )
    );
  }
}

Widget recievedMessage(String msg) {
  return Bubble(
    margin: BubbleEdges.only(top: 10),
    padding: BubbleEdges.fromLTRB(16, 10, 16, 10),
    alignment:Alignment.topLeft,
    nip: BubbleNip.leftTop,
    nipRadius: 0,
    nipWidth: 1,
    nipHeight: 20,
    radius: Radius.circular(20),
    child: Text(
      msg.trim(), 
      textAlign: TextAlign.right,
      style: TextStyle(
        fontSize: 16
      ),
    ),
  );
}

Widget sentMessage(String msg){
  return Bubble(
    margin: BubbleEdges.only(top: 10),
    padding: BubbleEdges.fromLTRB(16, 10, 16, 10),
    alignment: Alignment.topRight,
    nip: BubbleNip.rightTop,
    nipRadius: 0,
    nipWidth: 1,
    nipHeight: 20,
    radius: Radius.circular(20),
    color: Color.fromRGBO(225, 255, 199, 1.0),
    child: Text(
      msg.trim(), 
      textAlign: TextAlign.right,
      style: TextStyle(
        fontSize: 16
      ),
    ),
  );
}

Widget dateBubble(DateTime date){ 
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = DateTime(now.year, now.month, now.day - 1);
  final tomorrow = DateTime(now.year, now.month, now.day + 1);

  final aDate = DateTime(date.year, date.month, date.day);

  String dateString = DateFormat("dd MMM").format(date);
  if(aDate == today) {
    dateString = "today";
  } else if(aDate == yesterday) {
    dateString = "yesterday";
  } else if(aDate == tomorrow) {
    dateString = "tomorrow";
  }
  return Bubble(
    alignment: Alignment.center,
    color: Color.fromRGBO(212, 234, 244, 1.0),
    child: Text(dateString.toUpperCase(), textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
  );
}

Widget informationMessage(String message){
 return Bubble(
    alignment: Alignment.center,
    color: Color.fromRGBO(212, 234, 244, 1.0),
    child: Text(message, textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
  );
}

Widget message(int index, ModelMessage message, ModelMessage prevMessage){
  if(index==0||message.dateTime.isAfter(prevMessage.dateTime)){
    if(message.recepinetId==Auth().user().id){
        return Column(
          children: [
            dateBubble(message.dateTime),
            sentMessage(message.messageBody),
          ],
        );
    }else{
      return Column(
        children: [
          dateBubble(message.dateTime),
          recievedMessage(message.messageBody),
        ],
      );
    }
  }else{
    if(message.recepinetId==Auth().user().id){
      return sentMessage(message.messageBody);
    }else{
      return recievedMessage(message.messageBody);
    }
  }
}