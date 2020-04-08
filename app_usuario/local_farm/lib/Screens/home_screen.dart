import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/Screens/feed_screen.dart';
import 'package:localfarm/widgets/home_appBar.dart';
import 'package:localfarm/widgets/home_bottomBar.dart';
import 'package:localfarm/widgets/products_tile.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController(initialPage: 1);


  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          appBar: HomeAppBar(),
          body: Text("pedidos"),
          bottomNavigationBar: HomeBottomBar(_pageController , 0),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _pageController.jumpToPage(2);
            },
            child: Icon(Icons.blur_on),
            backgroundColor: Colors.grey,
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
        ),
        Scaffold(
          appBar: HomeAppBar(),
          body: Text("busca"),
          bottomNavigationBar: HomeBottomBar(_pageController , 1),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _pageController.jumpToPage(2);
            },
            child: Icon(Icons.blur_on),
            backgroundColor: Colors.grey,
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
        ),
        Scaffold(
          appBar: HomeAppBar(),
          body: FeedScreen(),
          bottomNavigationBar: HomeBottomBar(_pageController , 3),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _pageController.jumpToPage(2);
            },
            child: Icon(Icons.blur_on),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
        Scaffold(
          appBar: HomeAppBar(),
          body: Text("Favoritos"),
          bottomNavigationBar: HomeBottomBar(_pageController , 3),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _pageController.jumpToPage(2);
            },
            child: Icon(Icons.blur_on),
            backgroundColor: Colors.grey,
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
        ),
        Scaffold(
          appBar: HomeAppBar(),
          body: Text("Carrinho"),
          bottomNavigationBar: HomeBottomBar(_pageController , 4),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _pageController.jumpToPage(2);
            },
            child: Icon(Icons.blur_on),
            backgroundColor: Colors.grey,
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
        )
      ],
    );
  }
}
