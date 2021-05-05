import 'package:animore/logic/model/modelCart.dart';
import 'package:animore/logic/model/modelShoppingCardItem.dart';
import 'package:animore/ux/components/button/mediumButton.dart';
import 'package:animore/ux/components/card/memberShipCard.dart';
import 'package:animore/ux/components/card/starCard.dart';
import 'package:animore/ux/components/dialog/bottomSheetBuy.dart';
import 'package:animore/ux/components/dialog/dialogLogin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuyExpandedPage extends StatelessWidget {
  final ModelShoppingCardItem modelShoppingCardItem;
  final int index;
  final bool isFullview;
  BuyExpandedPage(this.modelShoppingCardItem, this.index, this.isFullview);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "buyImage${modelShoppingCardItem.title}${modelShoppingCardItem.id}$index$isFullview",
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBox){
                  return [
                    SliverAppBar(
                      iconTheme: IconThemeData(
                        color: Colors.white
                      ),
                      elevation: 0,
                      pinned: true,
                      floating: false,
                      snap: false,
                      backgroundColor: Colors.cyan,
                      expandedHeight: 200,
                      flexibleSpace: FlexibleSpaceBar(
                        background: !modelShoppingCardItem.fit? Container(
                          color: Colors.white,
                          child: SafeArea(
                            child: Image(image: modelShoppingCardItem.image, fit: BoxFit.contain,)
                          ),
                        ):
                        Image(image: modelShoppingCardItem.image, fit: BoxFit.cover,),
                      ),
                    )
                  ];
                }, 
                body: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          color: Colors.cyan,
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: 
                          Text(
                            modelShoppingCardItem.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: StarCard(
                                modelShoppingCardItem.reviewList.map((m) => m.rating).reduce((a, b) => a + b) / modelShoppingCardItem.reviewList.length
                              )
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                              child: Text(
                                "${modelShoppingCardItem.reviewList.length} ratings",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Text(
                            "Rs. ${modelShoppingCardItem.price}",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          height: 1,
                          color: Colors.black12,
                        ),
                        Builder(
                          builder:(context)=> InkWell(
                            onTap: (){
                              // ClipboardManager.copyToClipBoard("https://ventricles.page.link/?link=https://www.ventricles.com/signin?code=9069&apn=com.ventricles.animore.animore&ibi=com.ventricles.animore.animore&isi=1234567&ius=ventricles").then((result) {
                              //   final snackBar = SnackBar(
                              //     content: Text('Copied to Clipboard'),
                              //     action: SnackBarAction(
                              //       label: 'Undo',
                              //       onPressed: () {
                              //         ClipboardManager.copyToClipBoard("");
                              //       },
                              //     ),
                              //   );
                              //   Scaffold.of(context).showSnackBar(snackBar);
                              // });
                            },
                            child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              child: Icon(CupertinoIcons.share_up),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          height: 1,
                          color: Colors.black12,
                        ),
                        Container(
                          height: 5,
                          color: Colors.grey.shade200,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Text(
                            "Highlights",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: modelShoppingCardItem.highlights.length,
                            primary: false,
                            shrinkWrap: true,
                            itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text("• ${modelShoppingCardItem.highlights.elementAt(index)}"),
                              );
                            }
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          height: 1,
                          color: Colors.black12,
                        ),
                        InkWell(
                          onTap: (){
                            showGeneralDialog(
                              context: context, 
                              pageBuilder: (context, animation, secondaryAnimation) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    height: 300,
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Details",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          modelShoppingCardItem.allDetails
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              barrierDismissible: false,
                              transitionDuration: Duration(milliseconds: 200)
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "All Details",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          height: 1,
                          color: Colors.black12,
                        ),
                        
                        Container(
                          height: 5,
                          color: Colors.grey.shade200,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Text(
                            "Reviews",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: modelShoppingCardItem.reviewList.length,
                            primary: false,
                            shrinkWrap: true,
                            itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        StarCard(modelShoppingCardItem.reviewList.elementAt(index).rating),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          child: Text(
                                            "${modelShoppingCardItem.reviewList.elementAt(index).title}",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                      child: Text(
                                        "${modelShoppingCardItem.reviewList.elementAt(index).details}"
                                      )
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Divider(
                                        thickness: 1,
                                        height: 1,
                                        color: Colors.black12,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          height: 1,
                          color: Colors.black12,
                        ),
                        Container(
                          height: 5,
                          color: Colors.grey.shade200,
                        ),
                      ],
                    ),
                  ),
                ) 
              ),
            ),
            Container(
              height: 65,
              child: Row(
                children: [
                  Expanded(
                    child: Builder(
                      builder: (context)=> Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: ()async{
                            // await DbCart().insertCart(
                            //   ModelCart(name: modelShoppingCardItem.title, id: modelShoppingCardItem.id, price: modelShoppingCardItem.price.toString())
                            // );
                            Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text("Added to cart"))
                            );
                          },
                          child: Container(
                            height: 65,
                            alignment: Alignment.center,
                            child: Text(
                              "Add to cart"
                            ),
                          )
                        ),
                      ),
                    )
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context)=> Material(
                        color: Colors.deepOrange,
                        child: InkWell(
                          onTap: () async{
                            if(true){
                              showBottomSheet(
                                context: context, 
                                builder: (context) {
                                  return BottomSheetBuy(modelShoppingCardItem);
                                },
                              );
                            }else{
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) => DialogLogin(),
                              );
                            }
                          },
                          child: Container(
                            height: 65,
                            alignment: Alignment.center,
                            child: Text(
                              "Buy Now",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                          )
                        ),
                      ),
                    )
                  ),
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}