import 'package:animore/ux/components/button/primaryRoundedButton.dart';
import 'package:flutter/material.dart';

class DialogLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Through private account you cannot buy goods and have medic help. Please login by clicking the button below",
                style: TextStyle(
                  fontSize: 21
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: PrimaryRoundedButton(label: "lba", onPressed: (){},)
              )
            ],
          ),
        ),
      ),
    );
  }
}