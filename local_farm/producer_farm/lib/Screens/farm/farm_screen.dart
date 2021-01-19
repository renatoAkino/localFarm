import 'package:flutter/material.dart';
import 'package:producerfarm/Models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../Models/user_model.dart';
import '../login_screen.dart';
import 'components/floating_card_info.dart';
import 'components/home_appBar.dart';
import 'components/selos_widget.dart';

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
          backgroundColor: Colors.white,
          appBar: HomeAppBar(model: model),
          body: model.isLoggedin()
              ? Stack(
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
                    Positioned(
                      top: size.height * 0.4,
                      child: Container(
                        // color: Colors.blue,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Selos',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SelosFarmWidget(model.userData.farmData),
                              SizedBox(
                                height: 20,
                              ),

                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Descrição',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Container(
                                  child: Text(
                                      // '<Mussum Ipsum, cacilds vidis litro abertis. Casamentiss faiz malandris se pirulitá. Cevadis im ampola pa arma uma pindureta. Posuere libero varius.>',
                                      model.userData.farmData.description
                                      // textAlign: TextAlign.left,
                                      ),
                                ),
                              )

                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Column(
                              //       children: [
                              //         Text(
                              //           model.userData.name,
                              //           style: TextStyle(
                              //             fontSize: 20,
                              //           ),
                              //         ),
                              //         Text(
                              //           model.userData.adress +
                              //               ' - ' +
                              //               model.userData.adressComplement,
                              //           style: TextStyle(
                              //               // fontSize: 20,
                              //               ),
                              //         ),
                              //         Text(
                              //           'CEP: ' + model.userData.cep,
                              //           style: TextStyle(
                              //               // fontSize: 20,
                              //               ),
                              //         ),
                              //       ],
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 5,
                              // ),

                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              //       'Estabelecimento',
                              //       style: TextStyle(
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              //     ),
                              //     Text(model.userData.farmData.name),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              //       'Responsável',
                              //       style: TextStyle(
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              //     ),
                              //     Text(model.userData.name),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              //       'Endereço',
                              //       style: TextStyle(
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              //     ),
                              //     Text(model.userData.adress),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 20,
                              // ),

                              // FlatButton(
                              //     padding: EdgeInsets.zero,
                              //     onPressed: () {
                              //       Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) =>
                              //                   PostScreen()));
                              //     },
                              //     child: Text(
                              //       "Posts",
                              //       style: TextStyle(
                              //           color: Theme.of(context).accentColor,
                              //           fontWeight: FontWeight.bold),
                              //     )),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : FlatButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    "Faça Login",
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
        );
      },
    );
  }
}
