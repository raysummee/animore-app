import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ChatInputGroup extends StatefulWidget {
  @override
  _ChatInputGroupState createState() => _ChatInputGroupState();
}

class _ChatInputGroupState extends State<ChatInputGroup> with TickerProviderStateMixin{
  bool willSendMsg = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 2.0,spreadRadius: 2)]
      ),
      padding: EdgeInsets.fromLTRB(26, 10, 26, 10),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: TextField(
                  cursorHeight: 16,
                  onChanged: (val){
                    if(val!=null&&val.isNotEmpty&&!willSendMsg){
                      setState(() {
                        willSendMsg = true;
                      });
                    }else if(val==null||val.isEmpty&&willSendMsg){
                      setState(() {
                        willSendMsg = false;
                      });
                    }
                  },
                  cursorColor: Colors.cyan,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.grey.shade200.withOpacity(0.9),
                    filled: true,
                    contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    hintStyle: TextStyle(
                      color: Colors.black45,
                    ),
                    hintText: "Write a reply...",
                  ),
                ),
              ),
            ),
            AnimatedSizeAndFade(
              vsync: this,
              sizeDuration: Duration(milliseconds: 300),
              fadeDuration: Duration(milliseconds: 300),
              child: willSendMsg? chatSendButton: chatInputButtons,
            )
          ],
        ),
      ),
    );
  }
}


Widget chatInputButtons = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    IconButton(
      icon: Icon(FlutterIcons.image_mco, color: Colors.black54,), 
      onPressed: (){}
    ),
    IconButton(
      icon: Icon(FlutterIcons.attachment_ent, color: Colors.black54,), 
      onPressed: (){}
    ),
    PopupMenuButton(
      icon: Icon(Icons.more_vert),
      offset: Offset(0, -120),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text("Appointment")
        )
      ],
    )
  ],
);

Widget chatSendButton = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    SizedBox(
      width: 8,
    ),
    ClipOval(
      child: Material(
        color: Colors.cyan,
        child: InkWell(
          onTap: (){},
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Icon(FlutterIcons.send_fea, size: 20, color: Colors.white),
          )
        ), 
      ),
    ),
  ],
);