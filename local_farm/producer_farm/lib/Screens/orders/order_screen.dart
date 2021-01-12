import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:producerfarm/Datas/order_data.dart';
import 'package:producerfarm/Datas/product_data.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../Models/user_model.dart';
import '../../Models/user_model.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(UserModel.of(context).isLoggedin() ? UserModel.of(context).userData.name : ''),
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          return FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection('farms').doc(model.userData.farmData.farmId).collection('products').get(),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return ListView(
                    children: snapshot.data.docs.map(
                            (e){
                              ProductData productData = ProductData.fromDocument(e);
                              return Container(
                                child: Column(
                                  children: [
                                    Text(productData.image),
                                    Text(productData.name),
                                    Text(productData.price.toString()),
                                    Text(productData.type),
                                    Text(productData.quantity.toString()),
                                    Text(productData.description),
                                    Text(productData.soldPer)

                                  ],
                                ),
                              );
                            }
                  ).toList(),
                  );
                }
                return Container();
              });
        },
      ),
    );
  }
}
