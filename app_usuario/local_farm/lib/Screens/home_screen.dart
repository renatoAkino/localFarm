import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Models/user_model.dart';
import 'package:localfarm/Screens/feed_screen.dart';
import 'package:localfarm/Screens/search_screen.dart';
import 'package:localfarm/widgets/home_appBar.dart';

import 'dashboard/dashboard_screen.dart';
import 'edit_user_screen.dart';
import 'orders/orders_screen.dart';

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
        height: 66,
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
            Icon(Icons.assignment_outlined),
            Icon(Icons.person_outline),
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
        return SearchFarmersScreen();
        break;
      case 2:
        return FeedScreen();
        break;
      case 3:
        return OrderPage();
        break;
      case 4:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Perfil"),
              FlatButton(
                  color: Colors.orange,
                  padding: EdgeInsets.all(8),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EditUserScreen()),
                    );
                  },
                  child: Text(
                    "Editar Perfil",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        );
        break;
    }
  }
}
