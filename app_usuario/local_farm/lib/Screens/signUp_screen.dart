import 'package:flutter/material.dart';
import 'package:localfarm/Models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            if(model.isLoading){
              return Center(child: CircularProgressIndicator(),);
            }

            return Center(
              child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
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
                                onChanged: (text){

                                },
                                validator: (text) {
                                  if (text.isEmpty || !text.contains('@')) {
                                    return "Email inválido";
                                  }
                                  return null;
                                },
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
                              TextFormField(
                                controller: _confirmPassController,
                                decoration: InputDecoration(hintText: "Confirmar senha"),
                                obscureText: true,
                                keyboardType: TextInputType.emailAddress,
                                validator: (text) {
                                  if (text.isEmpty) {
                                    return "Senha inválida";
                                  }
                                  if(text != _passController.text){
                                    return "As senhas não coincidem";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                            height: 40,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              textColor: Colors.white,
                              color: Theme.of(context).primaryColor,
                              child: Text(
                                "Criar Conta",
                                style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              onPressed: () async {
                                if(_formKey.currentState.validate()){
                                  Map<String, dynamic> userData = Map();

                                  userData['email'] = _emailController.text;
                                  userData['nome'] = null;

                                  model.signUp(userData: userData, pass: _passController.text);

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
                        ),
                        SizedBox(height: 70,)
                      ],
                    )),
              ),
            );
          },
        )
    );
  }


}
