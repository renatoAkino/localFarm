import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/widgets/feed_tile.dart';
import 'package:localfarm/widgets/products_tile.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _search;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),

            onChanged: (text){
              setState(() {
                if(text != null && text != ""){
                  _search = text;
                }
              });
            },
          ),
        ),
        SizedBox(height: 20,),
        Expanded(
          child: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance.collection('products').getDocuments(),
            builder: (context, snapshot){
              if(_search == null || _search == ""){
                return Container();
              }

              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator(),);
              }else{
                return ListView(
                  children: snapshot.data.documents.map(
                          (doc){
                        ProductData data = ProductData.fromDocument(doc);
                        if(data.title.toLowerCase().contains(_search.toLowerCase())){
                          return FeedTile(data);
                        }
                        else return Container();
                      }
                  ).toList(),
                );
              }
            },
          ),
        )
      ],
    )

        ;
  }
}

