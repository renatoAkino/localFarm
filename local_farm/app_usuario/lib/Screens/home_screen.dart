import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Models/user_model.dart';
import 'package:localfarm/Screens/feed/feed_screen.dart';
import 'package:localfarm/Screens/login_screen.dart';
import 'package:localfarm/Screens/search_screen.dart';

import 'package:localfarm/widgets/home_appBar.dart';

import 'dashboard/dashboard_screen.dart';
import 'edit_user_screen.dart';
import 'orders/orders_screen.dart';
import 'search/search_farmers_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isBottomCartVisible = true;
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: HomeAppBar(),
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
              Icons.home_outlined,
              color: (_pageIndex == 0) ? Colors.white : Colors.green,
            ),
            Icon(
              // Icons.search,
              // Icons.explore_outlined,
              Icons.storefront,
              color: (_pageIndex == 1) ? Colors.white : Colors.green,
            ),
            Icon(
              Icons.camera_alt_outlined,
              color: (_pageIndex == 2) ? Colors.white : Colors.green,
            ),
            Icon(
              Icons.assignment_outlined,
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
        return DashboardScreen();
        // return Stack(
        //   alignment: Alignment.center,
        //   children: [
        //     DashboardScreen(),
        //     Visibility(
        //       visible: _isBottomCartVisible,
        //       child: Positioned(
        //         bottom: 0,
        //         child: MaterialButton(
        //           onPressed: () {},
        //           textColor: Colors.white,
        //           padding: const EdgeInsets.all(0.0),
        //           child: Container(
        //             width: 88,
        //             height: 30,
        //             decoration: BoxDecoration(
        //                 color: Color(0xff00D99E),
        //                 borderRadius: BorderRadius.circular(15),
        //                 boxShadow: [
        //                   BoxShadow(
        //                       blurRadius: 5,
        //                       offset: Offset(0, 15),
        //                       color: Color(0xff00D99E).withOpacity(.6),
        //                       spreadRadius: -9)
        //                 ]),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: <Widget>[
        //                 SizedBox(width: 6),
        //                 Text("CART",
        //                     style: TextStyle(
        //                       fontSize: 10,
        //                       color: Colors.white,
        //                       letterSpacing: 1,
        //                     ))
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     )
        //   ],
        // );
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
                  )),
              FlatButton(
                  color: Colors.orange,
                  padding: EdgeInsets.all(8),
                  onPressed: () {
                    UserModel.of(context).logout();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    "Logout",
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
