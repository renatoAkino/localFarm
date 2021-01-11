import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String image;
  final String category;

  CategoryTile(this.image, this.category);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.5, vertical: 15),
      child: GestureDetector(
        onTap: (){},
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          elevation: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(image)))),
              Text(category, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)
            ],
          ),
        ),
      ),
    );
  }
}
