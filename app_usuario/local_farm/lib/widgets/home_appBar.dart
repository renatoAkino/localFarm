import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{

  AppBar appBar = AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: GestureDetector(
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle
        ),
        child: Icon(Icons.perm_identity),
      ),
    ),
    actions: <Widget>[
      IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),),
    ],
  );



  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return appBar;
  }


}
