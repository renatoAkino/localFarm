import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/widgets/products_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),),
        ],
      ),
      body: Column(
        children: <Widget>[

              ProductsTile(),


        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.receipt),
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.shopping_cart),
              )
            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.blur_on),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
    );
  }
}
