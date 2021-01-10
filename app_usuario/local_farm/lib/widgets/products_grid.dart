import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/widgets/category_tile.dart';
import 'package:localfarm/widgets/products_tile.dart';

class ProductsGrid extends StatelessWidget {
  final AsyncSnapshot<QuerySnapshot> snapshot;
  ProductsGrid(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 60),
      child: StaggeredGridView.countBuilder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        itemBuilder: (context, index) {
          ProductData productData =
              ProductData.fromDocument(snapshot.data.documents[index]);
          return ProductsTile(productData);
        },
        itemCount: snapshot.data.documents.length,
        staggeredTileBuilder: (_) => StaggeredTile.fit(1),
      ),
    );
  }
}
//GridView.builder(
//shrinkWrap: true,
//physics: NeverScrollableScrollPhysics(),
//gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//crossAxisCount: 2,
//crossAxisSpacing: 4,
//mainAxisSpacing: 4,
//childAspectRatio: 0.7
//),
//itemCount: snapshot.data.documents.length,
//itemBuilder: (context, index){
//ProductData productData = ProductData.fromDocument(snapshot.data.documents[index]);
//return ProductsTile(productData);
//}
//),
