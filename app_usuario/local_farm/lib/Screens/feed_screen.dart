import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/widgets/products_tile.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
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
    );
  }
}
