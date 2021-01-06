import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localfarm/Models/cart_model.dart';
import 'package:localfarm/Models/user_model.dart';
import 'package:localfarm/Screens/home_screen.dart';
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
        child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            return ScopedModel<CartModel>(
              model: CartModel(model),
              child: MaterialApp(
                title: "Local Farm",
                home: HomeScreen(),
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ],
                supportedLocales: [const Locale('pt', 'BR')],
                theme: ThemeData(
                    primaryColor: Color.fromARGB(255, 51,196,155),
                    accentColor: Color.fromARGB(255, 19,74,60)
                ),
                debugShowCheckedModeBanner: false,
              ),
            );
          },
        )
    );
  }
}


