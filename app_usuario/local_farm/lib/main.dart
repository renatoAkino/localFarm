import 'package:flutter/material.dart';
import 'package:localfarm/Models/user_model.dart';
import 'package:localfarm/Screens/login_screen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
        model: UserModel(),
        child: MaterialApp(
          title: "Local Farm",
          home: LoginScreen(),
          theme: ThemeData(
              primaryColor: Color.fromARGB(255, 51,196,155),
              accentColor: Color.fromARGB(255, 41,158,125)
          ),
          debugShowCheckedModeBanner: false,
        )
    );
  }
}
