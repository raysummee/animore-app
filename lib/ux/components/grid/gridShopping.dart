import 'package:animore/logic/model/modelShoppingCardItem.dart';
import 'package:animore/ux/components/card/shoppingCard.dart';
import 'package:flutter/material.dart';

class GridShoppingList extends StatelessWidget {
  final List<ModelShoppingCardItem> listItem;
  final bool isScrollable;
  final bool isFullList;
  GridShoppingList(this.listItem, {this.isScrollable:false, this.isFullList:false});
  @override
  Widget build(BuildContext context) {
    print(listItem.length);
    return Container(
      child: GridView.builder(
        primary: isScrollable,
        shrinkWrap: isScrollable,
        physics: isScrollable? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
        itemCount: listItem.length,
        itemBuilder: (context, index){
          return ShoppingCard(listItem.elementAt(index), index, isFullList);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      ),
    );
  }
}