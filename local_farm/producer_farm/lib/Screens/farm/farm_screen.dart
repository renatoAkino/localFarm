import 'package:flutter/material.dart';
import 'package:producerfarm/Models/user_model.dart';

class FarmScreen extends StatefulWidget {
  @override
  _FarmScreenState createState() => _FarmScreenState();
}

class _FarmScreenState extends State<FarmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 2,
        title: Text(UserModel.of(context).userData.name),
      ),
      body: Container(

      ),
    );
  }
}
