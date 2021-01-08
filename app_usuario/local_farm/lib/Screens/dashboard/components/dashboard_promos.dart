import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  _ImageCarouselState createState() => new _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 18.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    Widget carousel = new Carousel(
      boxFit: BoxFit.cover,
      dotBgColor: Colors.transparent,
      images: [
        new AssetImage('assets/promo3.jpeg'),
        new AssetImage('assets/promo2.jpeg'),
        // new AssetImage('assets/promo5.jpeg'),
        // new AssetImage('assets/food4.jpeg'),
        // new AssetImage('assets/food5.jpeg'),
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(seconds: 1),
    );

    Widget banner = new Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 5.0),
      child: new Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0)),
          color: Colors.green.withOpacity(0.5),
        ),
        padding: const EdgeInsets.all(10.0),
        child: new Text(
          'Promoções',
          style: TextStyle(
            // fontFamily: 'fira',
            fontSize: 12, //18.0,
            color: Colors.white,
          ),
        ),
      ),
      // ),
      //  ),
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        // padding: const EdgeInsets.all(20.0),
        height: screenHeight / 4,
        width: screenWidth,
        child: new ClipRRect(
          // borderRadius: BorderRadius.circular(30.0),
          child: new Stack(
            children: [
              carousel,
              banner,
            ],
          ),
        ),
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
