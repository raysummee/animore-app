import 'package:animore/logic/model/modelShoppingCardItem.dart';
import 'package:animore/ux/components/button/mediumButton.dart';
import 'package:animore/ux/components/button/wideRoundedButton.dart';
import 'package:flutter/material.dart';

class BottomSheetBuy extends StatefulWidget {
  final ModelShoppingCardItem modelShoppingCardItem;
  BottomSheetBuy(this.modelShoppingCardItem);

  @override
  _BottomSheetBuyState createState() => _BottomSheetBuyState();
}

class _BottomSheetBuyState extends State<BottomSheetBuy> {
  TextEditingController editingController=TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25)
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 7
          )
        ]
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                width: 100,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Text(
                widget.modelShoppingCardItem.title,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                "Rs.${widget.modelShoppingCardItem.price}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Text(
                "Please fill up the details and click order now",
                style: TextStyle(
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    hintText: "Your Address"
                  ),
                  onChanged: (value){
                    editingController.text = value;
                  },
                ),
              )
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
              child: WideRoundedButton(
                isLoading? "Wait" :"Order Now!", 
                isLoading? (){} : () async{
                  if(editingController.text!=null&&editingController.text!=""){
                    setState(() {
                      isLoading = true;
                    });
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.of(context).pop();
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("Order Successfull"))
                    );
                  }
                }
              )
            )
          ],
        ),
      ),
    );
  }
}