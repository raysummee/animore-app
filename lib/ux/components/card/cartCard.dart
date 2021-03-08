import 'package:animore/logic/model/modelCart.dart';
import 'package:animore/logic/model/modelShoppingCardItem.dart';
import 'package:animore/ux/pages/main/subpagehome/buyExpandedPage.dart';
import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  final ModelCart modelCart;
  CartCard(this.modelCart);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () async{
          ModelShoppingCardItem modelShoppingCardItem = ModelShoppingCardItem();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_)=> BuyExpandedPage(
                modelShoppingCardItem,
                0,
                false
              )
            )
          );
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                modelCart.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  "Rs.${modelCart.price}"
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}