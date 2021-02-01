import 'package:flutter/material.dart';
import 'package:producerfarm/Models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../Models/user_model.dart';
import '../login_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        if (model.isLoggedin()) {
          print(model.firebaseUser.uid);
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.green,
            // leading: Image.asset('local_farm/producer_farm/assets/logo.png'),
            elevation: 1.5,
            title: Text(
              'Perfil',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: model.isLoggedin()
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Container(
                        // height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Nome',
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  // Text(
                                  //   'Id ' + widget.idCliente.toString(),
                                  //   style: TextStyle(
                                  //     // fontWeight: FontWeight.bold,
                                  //     fontSize: 16,
                                  //     color: Colors.grey,
                                  //   ),
                                  // ),
                                  Text(
                                    model.userData.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sexo',
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  // Text(
                                  //   'Id ' + widget.idCliente.toString(),
                                  //   style: TextStyle(
                                  //     // fontWeight: FontWeight.bold,
                                  //     fontSize: 16,
                                  //     color: Colors.grey,
                                  //   ),
                                  // ),
                                  Text(
                                    model.userData.gender,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(20.0),
                              //   child: Text(
                              //     cliente.nome.capitalize(),
                              //     style: TextStyle(
                              //       fontSize: 18,
                              //       color: Colors.grey[800],
                              //       fontWeight: FontWeight.bold,
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  Text(
                                    model.userData.email,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(20.0),
                              //   child: Text(
                              //     cliente.email,
                              //     style: TextStyle(
                              //       fontSize: 18,
                              //       color: Colors.grey[800],
                              //       fontWeight: FontWeight.bold,
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Endereço',
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  Text(
                                    model.userData.adress,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Complemento',
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  Text(
                                    '-' ?? model.userData.adressComplement,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'CEP',
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  Text(
                                    model.userData.cep,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Produção',
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  Text(
                                    model.userData.farmData.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Endereço',
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  Text(
                                    '-' ?? model.userData.farmData.adress,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlatButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      model.logout();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 40,
                                      color: Colors.orange,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Center(
                                          child: Text(
                                            "Logout",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  FlatButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      model.logout();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 40,
                                      color: Colors.orange,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Center(
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : FlatButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    model.logout();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    "Faça Login",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
        );
      },
    );
  }
}
