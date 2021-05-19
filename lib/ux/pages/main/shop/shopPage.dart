import 'package:animore/logic/model/modelReviews.dart';
import 'package:animore/logic/model/modelShoppingCardItem.dart';
import 'package:animore/ux/components/grid/gridShopping.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/2,
            color: Colors.cyan,
            alignment: Alignment.topLeft,
            child: Container(
              height: 200,
              color: Colors.cyan,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(16, 0, 32, 0),
              child: Text(
                "Shop",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
          ),
          SingleChildScrollView(
            child: Transform.translate(
              offset: Offset(0, 140),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)
                ),
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: 500,
                    minWidth: MediaQuery.of(context).size.width,
                  ),
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width+60,
                        child: GridShoppingList(<ModelShoppingCardItem>[
                          ModelShoppingCardItem(
                            title: "title", 
                            id: "id", 
                            allDetails: "allDetails", 
                            highlights: ["highlights"], 
                            image: AssetImage("lib/assets/images/demo.png"), 
                            price: 120, 
                            reviewList: [ModelReviews("title", "details", 1)]
                          ),
                          ModelShoppingCardItem(
                            title: "title", 
                            id: "id", 
                            allDetails: "allDetails", 
                            highlights: ["highlights"], 
                            image: AssetImage("lib/assets/images/demo.png"), 
                            price: 120, 
                            reviewList: [ModelReviews("title", "details", 1)]
                          ),
                          ModelShoppingCardItem(
                            title: "title", 
                            id: "id", 
                            allDetails: "allDetails", 
                            highlights: ["highlights"], 
                            image: AssetImage("lib/assets/images/demo.png"), 
                            price: 120, 
                            reviewList: [ModelReviews("title", "details", 1)]
                          ),
                          
                          ModelShoppingCardItem(
                            title: "title", 
                            id: "id", 
                            allDetails: "allDetails", 
                            highlights: ["highlights"], 
                            image: AssetImage("lib/assets/images/demo.png"), 
                            price: 120, 
                            reviewList: [ModelReviews("title", "details", 1)]
                          )
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}