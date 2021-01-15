import 'package:flutter/material.dart';
import 'package:producerfarm/Models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../Models/user_model.dart';
import '../../Models/user_model.dart';
import '../../Models/user_model.dart';
import '../login_screen.dart';
import 'components/floating_card_info.dart';
import 'components/home_appBar.dart';

class FarmScreen extends StatefulWidget {
  @override
  _FarmScreenState createState() => _FarmScreenState();
}

class _FarmScreenState extends State<FarmScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        if (model.isLoggedin()) {
          print(model.firebaseUser.uid);
        }
        return Scaffold(
          appBar: HomeAppBar(),
          body: Stack(
            children: [
              Container(
                height: size.height * 0.3,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.green,
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(20.0),
                  //   bottomRight: Radius.circular(20.0),
                  // ),
                ),
                child: Image.network(
                  model.userData.farmData.image,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Center(
                child: FloatingCard(),
              ),
              model.isLoggedin()
                  ? Padding(
                      padding: const EdgeInsets.only(
                          top: 110.0, left: 15.0, right: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(model.userData.farmData.farmId),
                          Text(model.userData.farmData.name),
                          Text(model.userData.farmData.distance.toString()),
                          Text(model.userData.farmData.image),
                          Text(model.userData.farmData.followers.toString()),
                          // FlatButton(
                          //     padding: EdgeInsets.zero,
                          //     onPressed: () {
                          //       model.logout();
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => LoginScreen()));
                          //     },
                          //     child: Text(
                          //       "Logout",
                          //       style: TextStyle(
                          //           color: Theme.of(context).accentColor,
                          //           fontWeight: FontWeight.bold),
                          //     )),
                          // FlatButton(
                          //     padding: EdgeInsets.zero,
                          //     onPressed: () {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => OrderScreen()));
                          //     },
                          //     child: Text(
                          //       "Pedidos",
                          //       style: TextStyle(
                          //           color: Theme.of(context).accentColor,
                          //           fontWeight: FontWeight.bold),
                          //     )),
                          // FlatButton(
                          //   padding: EdgeInsets.zero,
                          //   onPressed: () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => ProductScreen()));
                          //   },
                          //   child: Text(
                          //     "Produtos",
                          //     style: TextStyle(
                          //         color: Theme.of(context).accentColor,
                          //         fontWeight: FontWeight.bold),
                          //   ),
                          // )
                        ],
                      ),
                    )
                  : FlatButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        "Faça Login",
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold),
                      ))
            ],
          ),
        );
      },
    );
  }
}
