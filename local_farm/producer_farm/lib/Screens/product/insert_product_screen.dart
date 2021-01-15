import 'package:flutter/material.dart';
import 'package:producerfarm/Datas/product_data.dart';

class InsertProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Cadastrar Produto'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.green),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(child: Text('página cadastro')),
      bottomSheet: FlatButton(
        onPressed: () {
          //adicionar função de mudança no status
          Navigator.of(context).pop();
        },
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              'Continuar',
              style: TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
