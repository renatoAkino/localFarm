import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:producerfarm/Screens/farm/farm_screen.dart';

import 'orders/product_screen.dart';
import 'product/order_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  bool _isBottomCartVisible = true;
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      // appBar: HomeAppBar(),
      bottomNavigationBar: Container(
        height: 66,
        color: Colors.transparent,
        child: CurvedNavigationBar(
          height: 55.0,
          backgroundColor: Colors.transparent,
          index: _pageIndex,
          // buttonBackgroundColor: Theme.of(context).primaryColor,
          buttonBackgroundColor: Colors.green,
          items: <Widget>[
            Icon(
              Icons.bar_chart,
              color: (_pageIndex == 0) ? Colors.white : Colors.green,
            ),
            Icon(
              // Icons.search,
              // Icons.explore_outlined,
              Icons.storefront,
              color: (_pageIndex == 1) ? Colors.white : Colors.green,
            ),
            Icon(
              Icons.assignment_outlined,
              color: (_pageIndex == 2) ? Colors.white : Colors.green,
            ),
            Icon(
              Icons.local_shipping_outlined,
              color: (_pageIndex == 3) ? Colors.white : Colors.green,
            ),
            Icon(
              Icons.person_outline,
              color: (_pageIndex == 4) ? Colors.white : Colors.green,
            ),
          ],
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
        ),
      ),
      body: _getPage(_pageIndex),
      // backgroundColor: Color.fromRGBO(247, 246, 237, 1),
      // backgroundColor: Color.fromRGBO(250, 252, 247, 1),
    );
  }

  Widget _getPage(index) {
    switch (index) {
      case 0:
        return FarmScreen();
        break;
      case 1:
        return ProductScreen();
        break;
      case 2:
        return OrderScreen();
        return null;
        break;
      case 3:
        // return OrderPage();
        return null;
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
                  // model.logout();
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => LoginScreen()));
                },
                child: Text(
                  "Logout",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
        break;
    }
  }
}
