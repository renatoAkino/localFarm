import 'package:flutter/material.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/Screens/product_screen.dart';

class ProductsTile extends StatelessWidget {
  final ProductData productData;

  ProductsTile(this.productData);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.5, vertical: 15),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductScreen(productData)
          ));
        },
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          elevation: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  child: Image(image: NetworkImage(productData.images['0']),),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(productData.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                          Text(productData.description),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('R\$ ${productData.price.toStringAsFixed(2)}'),
                          IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.add)
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
