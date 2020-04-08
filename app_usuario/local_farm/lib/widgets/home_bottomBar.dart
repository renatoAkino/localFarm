import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeBottomBar extends StatelessWidget{

  final int page;
  final PageController controller;

  HomeBottomBar(this.controller, this.page);





  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: (){
                  controller.jumpToPage(0);
                },
                icon: Icon(
                  Icons.receipt,
                  color: page == 0 ?
                  Theme.of(context).accentColor :
                  Colors.black
                  ,

                ),
              ),
              IconButton(
                onPressed: (){
                  controller.jumpToPage(1);
                  },
                icon: Icon(Icons.search,
                    color: page == 1 ?
                    Theme.of(context).accentColor :
                    Colors.black),
              ),
              SizedBox(width: 10,),

              IconButton(
                onPressed: (){

                  controller.jumpToPage(3);
                },
                icon: Icon(Icons.star_border,
                    color: page == 3 ?
                    Theme.of(context).accentColor :
                    Colors.black),
              ),
              IconButton(
                onPressed: (){
                  controller.jumpToPage(4);
                  },
                icon: Icon(Icons.shopping_cart,
                    color: page == 4 ?
                    Theme.of(context).accentColor :
                    Colors.black),
              )
            ],
          ),
        )
    );
  }

}
