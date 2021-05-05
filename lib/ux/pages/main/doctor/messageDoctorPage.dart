import 'package:animore/logic/model/modelVetBook.dart';
import 'package:animore/ux/components/appbar/chatAppbar.dart';
import 'package:animore/ux/components/group/chatInputGroup.dart';
import 'package:animore/ux/components/others/customCircleAvatar.dart';
import 'package:flutter/material.dart';
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
                  image: AssetImage("lib/assets/images/chatBGCyan.png")
                )
              ),
            ) 
          ),
          ChatInputGroup()
        ],
      )
    );
  }
}