import 'package:animore/logic/model/modelShoppingCardItem.dart';
import 'package:animore/ux/pages/home/subpagehome/buyExpandedPage.dart';
import 'package:flutter/material.dart';

class ShoppingCard extends StatelessWidget {
  final ModelShoppingCardItem modelShoppingCardItem;
  final int index;
  final bool isFullview;
  ShoppingCard(this.modelShoppingCardItem, this.index, this.isFullview);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Container(
              child:ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Hero(
                            tag: "buyImage${modelShoppingCardItem.title}${modelShoppingCardItem.id}$index$isFullview",
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(image: modelShoppingCardItem.image, fit: modelShoppingCardItem.fit? BoxFit.cover: BoxFit.contain)
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: double.infinity,
                            color: Colors.cyan,
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Text(
                              modelShoppingCardItem.title.length>15?"${modelShoppingCardItem.title.substring(0, 12)}...":modelShoppingCardItem.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              child: InkWell(
                onTap: ()=>Navigator.of(context).push(
                  MaterialPageRoute(builder: (_)=> BuyExpandedPage(modelShoppingCardItem, index, isFullview))
                ),
                splashColor: Colors.deepOrange.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
                child: Container(),
              ),
            )
          ],
        ),
      ),
    );
  }
}