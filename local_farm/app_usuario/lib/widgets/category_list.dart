import 'package:flutter/material.dart';
import 'package:localfarm/Datas/farm_data.dart';
import 'package:localfarm/widgets/category_tile.dart';

class CategoryList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      height: 150.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CategoryTile('assets/frutas.png','Frutas'),
          CategoryTile('assets/legumes.png','Legumes'),
          CategoryTile('assets/frutas.png','Frutas'),
          CategoryTile('assets/legumes.png','Legumes'),
        ],
      ),
    );
  }
}
