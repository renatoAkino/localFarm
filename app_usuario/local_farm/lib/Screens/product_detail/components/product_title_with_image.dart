import 'package:flutter/material.dart';
import 'package:localfarm/Datas/product_data.dart';

import '../../../constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            // "<Fazenda do Sol>",
            "Produto",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.name,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "R\$${product.price}\n",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                          ),
                    ),
                    TextSpan(
                      text: 'por ' + product.soldPer,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  width: MediaQuery.of(context).size.height * 0.28,
                  child: Hero(
                    tag: "${product.id}",
                    // child: Image.asset(
                    //   'assets/tomatoes.png',
                    //   fit: BoxFit.fill,
                    // ),
                    child: Image.network(
                      product.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
