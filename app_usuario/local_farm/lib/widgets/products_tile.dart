import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductsTile extends StatelessWidget {
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
                Row(
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/localfarm-61f22.appspot.com/o/download%20(1).jfif?alt=media&token=5d8908f8-9072-4dd9-b68f-3c6ff7e9bcb6"))
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text("Fazendiha do Zéca", style: TextStyle( fontWeight: FontWeight.w500, fontSize: 15),)
                  ],
                ),
                IconButton(
                  onPressed: (){},
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
                  image: DecorationImage(image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/localfarm-61f22.appspot.com/o/alface%201.jpg?alt=media&token=c84aea30-c900-4030-b70f-8d71e08d85c4"),
                  fit: BoxFit.cover),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/localfarm-61f22.appspot.com/o/alface%202.jfif?alt=media&token=bdd0447b-6aed-437c-9368-dea7d3ad1995"),
                  fit: BoxFit.cover)
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/localfarm-61f22.appspot.com/o/alface%203.jfif?alt=media&token=afb89c98-452c-46bd-ab40-4b6319f41b74"),
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
                      Text("Alface" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      Container(
                        child: Text("Alface plantado seila quando, muito \ngostoso, etc.", style: TextStyle(fontSize: 11),),
                      )
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: (){},
                    ),
                    Text("0"),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: (){},
                    )
                  ],
                )

              ],
            ),
          ),





        ],

      ),
    );
  }
}
