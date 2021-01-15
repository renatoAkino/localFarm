import 'package:flutter/material.dart';
import 'package:producerfarm/Models/user_model.dart';

import 'package:scoped_model/scoped_model.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  AppBar appBar = AppBar();

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    // return AppBar(
    //   backgroundColor: Colors.transparent,
    //   elevation: 0,
    //   title: Row(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       SizedBox(
    //         width: 10,
    //       ),
    //       Icon(
    //         Icons.menu,
    //         color: Colors.green,
    //         size: 30.0,
    //       ),
    //       // SvgPicture.asset(
    //       //   'assets/icons/location-pin.svg',
    //       //   height: 30.0,
    //       // ),
    //       Flexible(
    //         child: Container(
    //           padding: EdgeInsets.only(left: 15.0),
    //           // width: 130,
    //           child: Text(
    //             UserModel.of(context).isLoggedin()
    //                 ? UserModel.of(context).userData.name
    //                 : '',
    //             overflow: TextOverflow.ellipsis,
    //             style: TextStyle(color: Colors.black87),
    //             textAlign: TextAlign.center,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    //   titleSpacing: 0,
    //   // actions: <Widget>[
    //   //   IconButton(
    //   //     onPressed: () {
    //   //       Navigator.of(context).push(
    //   //         MaterialPageRoute(
    //   //           // builder: (context) => CartScreen(),
    //   //           builder: (context) => CartScreen(),
    //   //         ),
    //   //       );
    //   //     },
    //   //     icon: Icon(Icons.shopping_cart_outlined),
    //   //   ),
    //   // ],
    // );
    return AppBar(
      backgroundColor: Colors.white,
      // backgroundColor: Colors.blueGrey[50],
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.green,
        ),
        onPressed: () {},
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
    );
  }
}
