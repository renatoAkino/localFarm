import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Screens/feed_screen.dart';
import 'package:localfarm/Screens/search_screen.dart';
import 'package:localfarm/widgets/home_appBar.dart';
import 'package:localfarm/widgets/home_bottomBar.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: HomeAppBar(),
          body: Text("pedidos"),
          bottomNavigationBar: HomeBottomBar(_pageController , 0),
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
          resizeToAvoidBottomPadding: false,
          appBar: HomeAppBar(),
          body: SearchScreen(),
          bottomNavigationBar: HomeBottomBar(_pageController , 1),
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
          resizeToAvoidBottomPadding: false,
          appBar: HomeAppBar(),
          body: FeedScreen(),
          bottomNavigationBar: HomeBottomBar(_pageController , 2),
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
          resizeToAvoidBottomPadding: false,
          appBar: HomeAppBar(),
          body: Text("Favoritos"),
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
          resizeToAvoidBottomPadding: false,
          appBar: HomeAppBar(),
          body: Text("Carrinho"),
          bottomNavigationBar: HomeBottomBar(_pageController , 4),
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
      ],
    );
  }


}
