import 'package:animore/logic/model/modelShoppingCardItem.dart';
import 'package:animore/ux/components/grid/gridShopping.dart';
import 'package:flutter/material.dart';

class MoreViewBuy extends StatelessWidget {
  final String collection;
  final String title;
  MoreViewBuy(this.collection, this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.cyan,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.more_vert), 
                      onPressed: (){}
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 40, 30, 0),
                      child: Text(
                        "More $title",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        )
                      )
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)
                      ),
                    ),
                    width: double.infinity,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height-kToolbarHeight-kBottomNavigationBarHeight-78,
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: StreamBuilder<void>(
                                // stream: Firestore.instance.collection(collection).snapshots(),
                                builder: (context, snapshot) {
                                  if(true){
                                    List<ModelShoppingCardItem> modelShoppingCardItems = List.generate(
                                      2, 
                                      (index) => ModelShoppingCardItem()
                                    );
                                    
                                    return GridShoppingList(
                                      modelShoppingCardItems,
                                      isScrollable: true,
                                    );
                                  }
                                  else
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                }
                              )
                            ),
                        ],
                      ),
                    ),
                  )
                )
              )
            ]
          ),
        )
      ),
    );
  }
}