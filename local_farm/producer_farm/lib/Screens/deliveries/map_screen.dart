import 'package:flutter/material.dart';

class MapRoutingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // child: Image.network('https://i.stack.imgur.com/YDVJI.png',
        child: Image.network(
            'https://blog.angelengineering.com/content/images/2020/01/Screen-Shot-2020-01-15-at-2.09.45-PM.png',
            fit: BoxFit.cover),
      ),
    );
  }
}
