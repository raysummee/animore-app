import 'package:flutter/material.dart';

class MemberShipCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Container(
        child: Card(
          color: Colors.cyan.shade50,
          child: Container(
            height: 200,
          ),
        ),
      ),
    );
  }
}