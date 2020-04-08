import 'package:flutter/material.dart';
import 'package:localfarm/Models/user_model.dart';
import 'package:localfarm/Screens/home_screen.dart';
import 'package:localfarm/Screens/signUp_screen.dart';
import 'package:scoped_model/scoped_model.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            if(model.isLoading){
              return Center(child: CircularProgressIndicator());
            }
            else {
              return Center(
                child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          SizedBox(height: 20,),
                          Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage('assets/logo.png')))),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(hintText: "Email"),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (text) {

                                  },
                                  validator: (text) {
                                    if (text.isEmpty || !text.contains('@')) {
                                      return "Email inválido";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  controller: _passController,
                                  decoration: InputDecoration(hintText: "Senha"),
                                  obscureText: true,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (text) {
                                    if (text.isEmpty) {
                                      return "Senha inválida";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Não tem conta? "),
                              FlatButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => SignUpScreen()
                                    ));
                                  },
                                  child: Text(
                                    "Cadastre-se",
                                    style: TextStyle(
                                        color: Theme
                                            .of(context)
                                            .accentColor,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                          SizedBox(height: 20,),
                          SizedBox(
                              height: 40,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                textColor: Colors.white,
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                                child: Text(
                                  "Login",
                                  style:
                                  TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                      model.signIn(email: _emailController.text, pass: _passController.text, onSucess: onSucess, onFailed: onFailed);

                                  }
                                }
                                ,
                              )),
                          SizedBox(height: 10,),
                          OutlineButton(
                            splashColor: Colors.grey,
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            highlightElevation: 0,
                            borderSide: BorderSide(color: Colors.grey),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image(
                                      image: AssetImage("assets/google_logo.png"),
                                      height: 20.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Login com o Google',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              );
            }
          },
        )
    );
  }

  void onSucess(){
    print(UserModel.of(context).userData['birth']);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => HomeScreen()
        ));
  }

  void onFailed(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Falha ao entrar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
          backgroundColor: Theme.of(context).primaryColor,
          duration: Duration(seconds: 3),

        ));

  }
}


