import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Models/user_model.dart';
import 'package:localfarm/Screens/feed_screen.dart';
import 'package:localfarm/Screens/search_screen.dart';
import 'package:localfarm/widgets/home_appBar.dart';

import 'dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: HomeAppBar(),
        body: Stack(
          children: <Widget>[
            _getPage(_pageIndex),
            Align(
              alignment: Alignment.bottomCenter,
              child: CurvedNavigationBar(
                backgroundColor: Colors.transparent,
                index: _pageIndex,
                buttonBackgroundColor: Theme.of(context).primaryColor,
                items: <Widget>[
                  Icon(Icons.receipt),
                  Icon(Icons.search),
                  Icon(Icons.blur_on),
                  Icon(Icons.star_border),
                  Icon(Icons.shopping_cart),
                ],
                onTap: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
              ),
            )
          ],
        ));
  }

  Widget _getPage(index) {
    switch (index) {
      case 0:
        return DashboardScreen();
        break;
      case 1:
        return SearchScreen();
        break;
      case 2:
        return FeedScreen();
        break;
      case 3:
        return Center(
          child: Text("Favoritos"),
        );
        break;
      case 4:
        return Center(
          child: Text("Carrinho"),
        );
        break;
    }
  }
}
