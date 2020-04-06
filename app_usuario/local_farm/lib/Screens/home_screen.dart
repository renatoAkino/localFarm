import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/widgets/products_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),),
        ],
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection('products').orderBy('data_public').getDocuments(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
          }else{
            return ListView(
              children: snapshot.data.documents.map(
                  (doc){
                    ProductData data = ProductData.fromDocument(doc);
                    return ProductsTile(data);
                  }
              ).toList(),
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.receipt),
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.shopping_cart),
              )
            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.blur_on),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
    );
  }
}
