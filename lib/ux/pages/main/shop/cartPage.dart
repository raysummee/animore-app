import 'package:animore/logic/model/modelCart.dart';
import 'package:animore/ux/components/card/cartCard.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Your Cart"),
        backgroundColor: Colors.cyan,
      ),
      body: FutureBuilder<List<ModelCart>>(
        // future: DbCart().getTodos(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            if(snapshot.data.isNotEmpty){
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder:(context, index)=>
                Container(
                  child: CartCard(
                    snapshot.data.elementAt(index)
                  ),
                ),
              );
            }else{
              return Center(
                child: Text("Your cart is empty!"),
              );
            }
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
    );
  }
}