import 'package:animore/logic/provider/weekSelectNotify.dart';
import 'package:animore/ux/components/complex/customDropdown/customDropdownItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class CustomDropdown extends StatelessWidget {
  final List items;
  CustomDropdown(this.items);
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WeekSelectNotify>(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      alignment: Alignment.center,
      child: TextButton(
        onPressed: (){
          CustomDropdownItems.showBottomSheet(context);
        },
        child: Row(
          children: [
            Text(
              provider.weekName.toUpperCase(), 
              style: TextStyle(color: Colors.black),
            ),
            Icon(FlutterIcons.arrow_drop_down_mdi, color: Colors.black,)
          ],
        ),
      ),
    );
  }
}