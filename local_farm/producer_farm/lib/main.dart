import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';

import 'Models/user_model.dart';
import 'Screens/deliveries/calendar_screen.dart';
import 'Screens/tab_screen.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ScopedModel<UserModel>(
            model: UserModel(),
            child: ScopedModelDescendant<UserModel>(
              builder: (context, child, model) {
                return MaterialApp(
                  // title: "Local Farm",
                  home: TabScreen(),
                  // home: CalendarScreen(),

                  localizationsDelegates: [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate
                  ],
                  supportedLocales: [const Locale('pt', 'BR')],
                  theme: ThemeData(
                      fontFamily: 'WorkSans',
                      primaryColor: Color.fromARGB(255, 51, 196, 155),
                      accentColor: Color.fromARGB(255, 19, 74, 60)),
                  debugShowCheckedModeBanner: false,
                );
              },
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
