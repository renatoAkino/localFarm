import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:localfarm/Datas/cart_data.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/stores/count_mobx.dart';

class CartCounter extends StatefulWidget {
  final ProductData product;
  final ItemCounterStore numItems;

  const CartCounter({Key key, @required this.product, this.numItems})
      : super(key: key);

  @override
  _CartCounterStore createState() => _CartCounterStore();
}

class _CartCounterStore extends State<CartCounter> {
  //
  // ItemCounterStore numItems = ItemCounterStore();

  // int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    // double valorTotal = widget.product.price * numItems;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: <Widget>[
            buildOutlineButton(
              icon: Icons.remove,
              press: widget.numItems.decrement,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15 / 2),
              child: Observer(builder: (_) {
                return Text(
                  // if our item is less  then 10 then  it shows 01 02 like that
                  widget.numItems.count.toString().padLeft(2, "0"),
                  style: Theme.of(context).textTheme.headline6,
                );
              }),
            ),
            buildOutlineButton(
              icon: Icons.add,
              press: widget.numItems.increment,
            ),
          ],
        ),
        Observer(builder: (_) {
          double valorTotal = widget.product.price * widget.numItems.count;
          return RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "R\$ ${valorTotal.toStringAsFixed(2)}",
                  // text: "R\$ 45678",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        }),
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

// class _CartCounterStore extends State<CartCounter> {
//   int numOfItems = 1;
//   @override
//   Widget build(BuildContext context) {
//     double valorTotal = widget.product.price * numOfItems;

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: <Widget>[
//             buildOutlineButton(
//               icon: Icons.remove,
//               press: () {
//                 if (numOfItems > 1) {
//                   setState(() {
//                     numOfItems--;
//                   });
//                 }
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15 / 2),
//               child: Text(
//                 // if our item is less  then 10 then  it shows 01 02 like that
//                 numOfItems.toString().padLeft(2, "0"),
//                 style: Theme.of(context).textTheme.headline6,
//               ),
//             ),
//             buildOutlineButton(
//                 icon: Icons.add,
//                 press: () {
//                   setState(() {
//                     numOfItems++;
//                   });
//                 }),
//           ],
//         ),
//         RichText(
//           text: TextSpan(
//             style: TextStyle(color: Colors.black),
//             children: [
//               TextSpan(
//                 text: "R\$ ${valorTotal.toStringAsFixed(2)}",
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline6
//                     .copyWith(fontWeight: FontWeight.bold),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   SizedBox buildOutlineButton({IconData icon, Function press}) {
//     return SizedBox(
//       width: 40,
//       height: 32,
//       child: OutlineButton(
//         padding: EdgeInsets.zero,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(13),
//         ),
//         onPressed: press,
//         child: Icon(icon),
//       ),
//     );
//   }
// }
