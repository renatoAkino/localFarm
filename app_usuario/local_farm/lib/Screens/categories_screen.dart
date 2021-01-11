import 'package:flutter/material.dart';
import 'package:localfarm/tmp/categories.dart';

import 'dashboard/components/dashboard_category.dart';
import 'dashboard/components/dashboard_grid_product.dart';
import '../tmp/foods.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  String catie = "Frutas";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Categorias",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          // IconButton(
          //   icon: IconBadge(
          //     icon: Icons.notifications,
          //     size: 22.0,
          //   ),
          //   onPressed: (){
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (BuildContext context){
          //           return Notifications();
          //         },
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            Container(
              height: 80.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categoriesSvg == null ? 0 : categoriesSvg.length,
                itemBuilder: (BuildContext context, int index) {
                  Map cat = categoriesSvg[index];
                  // print(cat['icon']);
                  return ListaCategoriasWidget(
                    icon: cat['icon'],
                    title: cat['name'],
                    // items: cat['items'].toString(),
                    isHome: false,
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "$catie",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
              ),
            ),
            Divider(),
            SizedBox(height: 10.0),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: foods == null ? 0 : foods.length,
              itemBuilder: (BuildContext context, int index) {
                Map food = foods[index];
                return Container();
//                return GridProduct(
//                  img: food['img'],
//                  isFav: false,
//                  name: food['name'],
//                  rating: 5.0,
//                  raters: 23,
//                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
