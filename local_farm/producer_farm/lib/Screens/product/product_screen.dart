import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:producerfarm/Datas/order_data.dart';
import 'package:producerfarm/Models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductScreen extends StatelessWidget {
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
              future: FirebaseFirestore.instance.collection('orders').get(),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return ListView(
                    children: snapshot.data.docs.map(
                            (e){
                          OrderData orderData = OrderData.fromDocument(e);
                          return Container(
                            child: Column(
                              children: [
                                Text(orderData.order_date.toString()),
                                Text(orderData.totalPrice.toString()),
                                Text(orderData.status.toString()),
                                Text(orderData.productsPrice.toString()),
                                Text(orderData.ship_date.toString()),
                                Text(orderData.client_id),

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
