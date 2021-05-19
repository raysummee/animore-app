import 'package:animore/logic/provider/weekSelectNotify.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDropdownItems extends StatelessWidget {
  static showDialog(BuildContext context){
    showGeneralDialog(
      context: context, 
      pageBuilder: (context, animation, secondaryAnimation) => CustomDropdownItems(),
    );
  }
  final PageController controller = PageController(
    viewportFraction: 0.4
  );
  final List<String> weeks = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"];
  static showBottomSheet(BuildContext context){
    showModalBottomSheet(
      context: context, 
      builder: (context) => CustomDropdownItems(),
    );
  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WeekSelectNotify>(context);
    print(provider.index);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      backgroundColor: Colors.white,
      child: Container(
        height: 240,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 22,
            ),
            Text(
              "Select Weekday",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 16,
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 5, mainAxisSpacing: 5),
              itemCount: weeks.length,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Material(
                  color: provider.index==index? Colors.deepOrange:Colors.cyan,
                  child: InkWell(
                    onTap: (){
                      if(index != provider.index){
                        provider.index = index;
                        provider.weekName = weeks[index];
                        Navigator.of(context).pop();
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        weeks[index].toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}