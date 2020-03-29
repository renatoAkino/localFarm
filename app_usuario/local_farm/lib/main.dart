import 'package:flutter/material.dart';
import 'package:localfarm/Screens/login_screen.dart';

void main() {
  return runApp(MaterialApp(
    title: "Local Farm",
    home: LoginScreen(),
    theme: ThemeData(
      primaryColor: Color.fromARGB(255, 51,196,155),
      accentColor: Color.fromARGB(255, 41,158,125)
    ),
    debugShowCheckedModeBanner: false,
  ));
}

