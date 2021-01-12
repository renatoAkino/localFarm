import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Datas/farm_data.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/Models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:localfarm/Datas/cart_data.dart';

class CartModel extends Model {
  UserModel user;

  bool isLoading = false;
  List<CartData> products = [];

  String couponCode;
  int discountPercentage = 0;

  CartModel(this.user) {
    if (user.isLoggedin()) _loadCartItems();
  }

  static CartModel of(BuildContext context) =>
      ScopedModel.of<CartModel>(context);

  void addCartItem(CartData cartData) {
    products.add(cartData);

    Firestore.instance
        .collection('users')
        .document(user.firebaseUser.uid)
        .collection('cart')
        .add(cartData.toMap())
        .then((doc) {
      cartData.cart_id = doc.documentID;
    });

    notifyListeners();
  }

  void removeCartItem(CartData cartData) {
    Firestore.instance
        .collection('users')
        .document(user.firebaseUser.uid)
        .collection('cart')
        .document(cartData.cart_id)
        .delete();

    products.remove(cartData);

    notifyListeners();
  }

  void decProduct(CartData cartData) {
    cartData.quantity--;

    Firestore.instance
        .collection('users')
        .document(user.firebaseUser.uid)
        .collection('cart')
        .document(cartData.cart_id)
        .updateData(cartData.toMap());

    notifyListeners();
  }

  void incProduct(CartData cartData) {
    cartData.quantity++;

    Firestore.instance
        .collection('users')
        .document(user.firebaseUser.uid)
        .collection('cart')
        .document(cartData.cart_id)
        .updateData(cartData.toMap());

    notifyListeners();
  }

  Future<void> _loadCartItems() async {
    QuerySnapshot query = await Firestore.instance
        .collection('users')
        .document(user.firebaseUser.uid)
        .collection('cart')
        .getDocuments();

    products =
        query.documents.map((doc) => CartData.fromDocument(doc)).toList();
    notifyListeners();
  }

  double getProductsPrice() {
    double price = 0.0;
    for (CartData c in products) {
      if (c.productData != null) {
        price += c.quantity * c.productData.price;
      }
    }
    return price;
  }

  Future<String> finishOrder() async {
    if (products.length == 0) return null;
    FarmData farmData;

    isLoading = true;
    notifyListeners();

    double productsPrice = getProductsPrice();
    double shipPrice = 0;
    DocumentReference refOrder =
        await Firestore.instance.collection('orders').add({
      'clientID': user.firebaseUser.uid,
      'products': products.map((cartProduct) => cartProduct.toMap()).toList(),
      'shipPrice': shipPrice,
      'productsPrice': productsPrice,
      'totalPrice': productsPrice + shipPrice,
      'status': 1,
      'order_date': Timestamp.fromDate(DateTime.now()),
      'ship_date': Timestamp.fromDate(genShipDay()),
    });

    await Firestore.instance
        .collection('users')
        .document(user.firebaseUser.uid)
        .collection('orders')
        .document(refOrder.documentID)
        .setData({'orderID': refOrder.documentID});

    QuerySnapshot query = await Firestore.instance
        .collection('users')
        .document(user.firebaseUser.uid)
        .collection('cart')
        .getDocuments();

    for (DocumentSnapshot doc in query.documents) {
      doc.reference.delete();
    }

    products.clear();

    isLoading = false;
    notifyListeners();

    return refOrder.documentID;
  }

  DateTime genShipDay() {
    DateTime today = DateTime.now();
    return today.add(new Duration(days: 7));
  }
}
