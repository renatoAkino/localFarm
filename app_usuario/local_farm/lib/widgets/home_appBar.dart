import 'package:flutter/material.dart';
import 'package:localfarm/Models/user_model.dart';
import 'package:localfarm/Screens/edit_user_screen.dart';
import 'package:localfarm/Screens/login_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  AppBar appBar = AppBar();

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          return Row(
            children: <Widget>[
              GestureDetector(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Icon(model.isLoggedin() ? Icons.exit_to_app : Icons.perm_identity),
                    ),
                  ],
                ),
                onTap: () {
                  if (!model.isLoggedin()) {
                    print(model.userData['name']);
                    Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
                  } else {
                    print(model.userData['name']);
                    model.logout();


                  }
                },
              ),
            ],
          );
        },
      ),
      title: ScopedModelDescendant<UserModel>(
      builder: (context, child, model){
        return
          GestureDetector(
            child: Text(model.isLoggedin()
                ? model.userData['name']
                : 'Fazer Login'),
            onTap: (){
              if(model.isLoggedin()){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => EditUserScreen()));
              }
            },
          );

      }),
      titleSpacing: 0,
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert),
        ),
      ],
    );
  }
}



