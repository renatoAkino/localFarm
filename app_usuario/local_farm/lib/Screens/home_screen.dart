import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Models/user_model.dart';
import 'package:localfarm/Screens/feed_screen.dart';
import 'package:localfarm/Screens/search_screen.dart';
import 'package:localfarm/widgets/home_appBar.dart';

import 'dashboard/dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: HomeAppBar(),
      bottomNavigationBar: Container(
        height: 65,
        color: Colors.green,
        child: CurvedNavigationBar(
          height: 55.0,
          backgroundColor: Colors.green,
          index: _pageIndex,
          // buttonBackgroundColor: Theme.of(context).primaryColor,
          buttonBackgroundColor: Colors.white,
          items: <Widget>[
            Icon(Icons.home_outlined),
            Icon(Icons.search),
            Icon(Icons.camera_alt_outlined),
            Icon(Icons.star_border),
            Icon(Icons.shopping_cart_outlined),
          ],
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
        ),
      ),
      body: _getPage(_pageIndex),
    );
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
