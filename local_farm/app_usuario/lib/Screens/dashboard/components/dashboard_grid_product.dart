import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:localfarm/Datas/product_data.dart';

import '../../product_detail/product_detail_screen.dart';

class GridProduct extends StatelessWidget {
  final ProductData productData;

  const GridProduct(this.productData);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height / 3.6,
                  width: MediaQuery.of(context).size.width / 2.2,
                  child: Image.network(
                    productData.image,
                    fit: BoxFit.contain,
                  )),
              // Positioned(
              //   right: -10.0,
              //   bottom: 3.0,
              //   child: RawMaterialButton(
              //     onPressed: () {},
              //     fillColor: Colors.white,
              //     shape: CircleBorder(),
              //     elevation: 4.0,
              //     child: Padding(
              //       padding: EdgeInsets.all(5),
              //       child: Icon(
              //         isFav ? Icons.favorite : Icons.favorite_border,
              //         color: Colors.red,
              //         size: 17,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 2.0, top: 8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      productData.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.0,
                        // fontWeight: FontWeight.w900,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.0, top: 8.0, left: 5.0),
                  child: Text(
                    "R\$ ${productData.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 16.0,
                      // fontWeight: FontWeight.w900,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.0, top: 2.0, left: 8.0),
            child: Row(
              children: <Widget>[
                // SmoothStarRating(
                //   starCount: 5,
                //   color: Constants.ratingBG,
                //   allowHalfRating: true,
                //   rating: rating,
                //   size: 10.0,
                // ),
                Text(
                  // " $rating ($raters Reviews)",
                  productData.farm_name,
                  style: TextStyle(
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return DetailsScreen(
                product: productData,
              );
            },
          ),
        );
      },
    );
  }

  // String _getFarmName(ProductData productData) {
  //   var farmName;
  //   productData.getFarmName().then((name) => farmName = name);
  //   log(farmName);
  // }
}

/*

Plataforma Multilateral de Comércio e Entrega de Orgânicos: 
Otimização combinatória e Machine Learning aplicados à soluções mobile


*/
