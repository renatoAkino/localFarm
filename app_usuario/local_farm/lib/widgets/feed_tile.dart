import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/Screens/store_screen.dart';

class FeedTile extends StatelessWidget {

  final ProductData product;

  FeedTile(this.product);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FutureBuilder(
                  future: product.getFarmData(),
                  builder: (context, snapshot){
                    if(product.farmData != null){
                      return Row(
                        children: <Widget>[
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: NetworkImage(product.farmData.image))
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text(product.farmData.name, style: TextStyle( fontWeight: FontWeight.w500, fontSize: 15),)
                        ],
                      );
                    }
                    else{
                      return Container();
                    }
                  },
                ),
                IconButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StoreScreen(product.farmData)
                    ));
                  },
                  icon: Icon(Icons.layers),
                )
              ],
            ),
          ),
          CarouselSlider(
            viewportFraction: 1.0,
            aspectRatio: 2.0,
            enlargeCenterPage: false,
            enableInfiniteScroll: false,
            items: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(product.images['0']),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(product.images['1']),
                        fit: BoxFit.cover)
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(product.images['2']),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(product.title , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      Container(
                        width: MediaQuery.of(context).size.width*0.6,
                        child:  Text(product.description, style: TextStyle(fontSize: 11), overflow: TextOverflow.ellipsis,),
                      )
                    ],
                  ),
                ),
                Container(
                    child:
                          Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: (){},
                              ),
                              SizedBox(width: 10,),
                              IconButton(
                                icon: Icon(Icons.star_border),
                                onPressed: (){},
                              )
                            ],
                          ))

              ],
            ),
          ),
          SizedBox(height: 20,)




        ],

      ),
    );
  }
}
