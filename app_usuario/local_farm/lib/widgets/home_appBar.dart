import 'package:flutter/material.dart';
import 'package:localfarm/Models/user_model.dart';
import 'package:localfarm/Screens/cart/cart_screen.dart';
import 'package:localfarm/Screens/edit_user_screen.dart';
import 'package:localfarm/Screens/login_screen.dart';
import 'package:scoped_model/scoped_model.dart';

import '../Screens/cart/components/cart_icon.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  AppBar appBar = AppBar();

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      // leading: ScopedModelDescendant<UserModel>(
      //   builder: (context, child, model) {
      //     return Row(
      //       children: <Widget>[
      //         GestureDetector(
      //           child: Row(
      //             children: <Widget>[
      //               Container(
      //                 height: 40,
      //                 width: 40,
      //                 decoration: BoxDecoration(shape: BoxShape.circle),
      //                 child: Icon(model.isLoggedin()
      //                     ? Icons.exit_to_app
      //                     : Icons.perm_identity),
      //               ),

      //             ],
      //           ),
      //           onTap: () {
      //             if (!model.isLoggedin()) {
      //               print(model.userData['name']);
      //               Navigator.of(context).pushReplacement(
      //                   MaterialPageRoute(builder: (context) => LoginScreen()));
      //             } else {
      //               print(model.userData['name']);
      //               model.logout();
      //             }
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // ),
      // title: ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      //   return GestureDetector(
      //     child: Padding(
      //       padding: const EdgeInsets.only(left: 10.0),
      //       child: Text(
      //           model.isLoggedin() ? model.userData['name'] : 'Fazer Login'),
      //     ),
      //     onTap: () {
      //       if (model.isLoggedin()) {
      //         Navigator.of(context).pushReplacement(
      //             MaterialPageRoute(builder: (context) => EditUserScreen()));
      //       }
      //     },
      //   );
      // }),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.location_on,
            color: Colors.green,
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(left: 10.0),
              // width: 130,
              child: Text(
                'Rua Itapoã, 58',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          // SizedBox(
          //   width: 5,
          // ),
          IconButton(
            icon: Icon(Icons.arrow_drop_down),
            onPressed: () {},
          ),
        ],
      ),
      titleSpacing: 0,
      // actions: <Widget>[
      //   IconButton(
      //     onPressed: () {
      //       Navigator.of(context).push(
      //         MaterialPageRoute(
      //           // builder: (context) => CartScreen(),
      //           builder: (context) => CartScreen(),
      //         ),
      //       );
      //     },
      //     icon: Icon(Icons.shopping_cart_outlined),
      //   ),
      // ],

      actions: <Widget>[CartIconWidget()],
    );
  }
}
