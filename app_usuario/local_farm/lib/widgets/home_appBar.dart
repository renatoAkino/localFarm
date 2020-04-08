import 'package:flutter/material.dart';
import 'package:localfarm/Models/user_model.dart';
import 'package:localfarm/Screens/edit_user_screen.dart';
import 'package:localfarm/Screens/login_screen.dart';


class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{



  AppBar appBar = AppBar();

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Row(
        children: <Widget>[
          GestureDetector(
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle
              ),
              child: Icon(Icons.perm_identity),
            ),
            onTap: (){
              if(!UserModel.of(context).isLoggedin()){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context)=>LoginScreen())
                );
              }else{
                UserModel.of(context).logout();
              }
            },
          ),

        ],
      ),
      actions: <Widget>[
        IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),),
      ],
    );;
  }


}
