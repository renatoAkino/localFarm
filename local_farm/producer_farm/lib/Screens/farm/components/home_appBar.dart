import 'package:flutter/material.dart';
import 'package:producerfarm/Models/user_model.dart';
import 'package:producerfarm/Screens/dashboard/dashboard_screen.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../login_screen.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  AppBar appBar = AppBar();
  UserModel model;
  HomeAppBar({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      // backgroundColor: Colors.blueGrey[50],
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.show_chart,
          color: Colors.green,
          size: 30,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              // builder: (context) => CartScreen(),
              builder: (context) => DashboardScreen(),
            ),
          );
        },
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text(
          //   'Olá,',
          //   textAlign: TextAlign.left,
          //   style: TextStyle(
          //     fontWeight: FontWeight.w400,
          //     fontSize: 14,
          //     letterSpacing: 0.6,
          //     color: Colors.green,
          //   ),
          // ),
          Text(
            UserModel.of(context).isLoggedin()
                ? UserModel.of(context).userData.farmData.name
                : '',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              // letterSpacing: 1.5,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.green,
          ),
          onPressed: () {
            model.logout();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        )
      ],
    );
  }
}
