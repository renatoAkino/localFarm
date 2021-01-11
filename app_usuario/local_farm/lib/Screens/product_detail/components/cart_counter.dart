import 'package:flutter/material.dart';
import 'package:localfarm/Datas/cart_data.dart';
import 'package:localfarm/Datas/product_data.dart';

class CartCounter extends StatefulWidget {
  final ProductData product;
  final CartData cartData;

  const CartCounter({Key key, @required this.product, this.cartData})
      : super(key: key);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    double valorTotal = widget.product.price * numOfItems;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: <Widget>[
            buildOutlineButton(
              icon: Icons.remove,
              press: () {
                if (numOfItems > 1) {
                  setState(() {
                    numOfItems--;
                  });
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15 / 2),
              child: Text(
                // if our item is less  then 10 then  it shows 01 02 like that
                numOfItems.toString().padLeft(2, "0"),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            buildOutlineButton(
                icon: Icons.add,
                press: () {
                  setState(() {
                    numOfItems++;
                  });
                }),
          ],
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: "R\$ ${valorTotal.toStringAsFixed(2)}",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
