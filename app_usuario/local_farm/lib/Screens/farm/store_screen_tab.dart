import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:localfarm/Datas/farm_data.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/widgets/products_tile.dart';

import '../product_detail/product_detail_screen.dart';
import '../product_screen.dart';
import 'components/categories_widget.dart';
import 'components/item_card_widget.dart';

class StoreScreenTab extends StatefulWidget {
  final FarmData farmData;
  StoreScreenTab(this.farmData);
  @override
  _StoreScreenTabState createState() => _StoreScreenTabState();
}

class _StoreScreenTabState extends State<StoreScreenTab> {
  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      // Alterar para os pedidos
      future: Firestore.instance.collection('products').getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          print(snapshot.data.documents.length);
          return Padding(
            padding: const EdgeInsets.only(
              right: 15,
              left: 15,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              // primary: false,
              itemCount: snapshot.data.documents.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                ProductData productData =
                    ProductData.fromDocument(snapshot.data.documents[index]);
                return ItemCard(
                  product: productData,
                  press: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => DetailsScreen(
                    //       product: snapshot.data.documents[index],
                    //     ),
                    //   ),
                    // );

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: productData,
                          ),
                        ));

                    //
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) =>
                    //         ProductScreen(productData)));
                  },
                );
              },
            ),
          );
        }
      },
    );
  }
}
