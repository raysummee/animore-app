import 'package:animore/logic/model/modelShoppingCardItem.dart';
import 'package:animore/ux/components/button/mediumButton.dart';
import 'package:animore/ux/components/dialog/animalAbuseDialog.dart';
import 'package:animore/ux/components/grid/gridShopping.dart';
import 'package:animore/ux/pages/main/moreViewBuy.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
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
                    PopupMenuButton(
                      onSelected: (value){
                        if(value==1){
                          // UniversalAuth().deleteAccount(context);
                        }else if(value==0){
                          showGeneralDialog(
                            context: context, 
                            barrierDismissible: false,
                            transitionDuration: Duration(milliseconds: 200),
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return AnimalAbuseDialog();
                            },
                          );
                        }
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      icon: Icon(Icons.more_vert, color: Colors.white,),
                      itemBuilder: (context){
                        return [
                          PopupMenuItem(child: Text("Report animal abuse"), value: 0,),
                          PopupMenuItem(child: Text("Delete account"), value: 1,)
                        ];
                      }
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 40, 30, 0),
                      child: Text(
                        "Shopping",
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
                        children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Product",
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: (_)=>MoreViewBuy("shopping", "Product"))
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "View All",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: StreamBuilder<void>(
                                // stream: fireStoreInstance.collection("shopping").limit(4).snapshots(),
                                builder: (context, snapshot) {
                                  if(true){
                                    List<ModelShoppingCardItem> modelShoppingCardItems = List.generate(
                                      4, 
                                      (index) => ModelShoppingCardItem()
                                    );
                                    return GridShoppingList(
                                      modelShoppingCardItems
                                    );
                                  }
                                  else
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                }
                              )
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Adoption",
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: (_)=>MoreViewBuy("adoption", "Adoption"))
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "View All",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.all(10),
                              child: StreamBuilder<void>(
                                // stream: fireStoreInstance.collection("adoption").limit(4).snapshots(),
                                builder: (context, snapshot) {
                                  if(true){
                                    List<ModelShoppingCardItem> modelShoppingCardItems = List.generate(
                                      4, 
                                      (index) => ModelShoppingCardItem()
                                    );
                                    return GridShoppingList(
                                      modelShoppingCardItems
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