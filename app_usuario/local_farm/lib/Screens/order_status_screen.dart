import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ScreenProgress extends StatelessWidget {
  // double deviceHeight(BuildContext context) =>
  //     MediaQuery.of(context).size.height;

  // double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  final int ticks;
  // final int lines;

  ScreenProgress({@required this.ticks});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon1(),
            spacerTop(),
            icon2(),
            spacerTop(),
            icon3(),
            spacerTop(),
            icon4(),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            tick1(),
            spacer(),
            line1(),
            spacer(),
            tick2(),
            spacer(),
            line2(),
            spacer(),
            tick3(),
            spacer(),
            line3(),
            spacer(),
            tick4(),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            text1(),
            spacerBottom(),
            text2(),
            spacerBottom(),
            text3(),
            spacerBottom(),
            text4(),
          ],
        ),
      ],
    );
  }

// -------------------------------- ICONS ----------------------------------------

  Widget icon1() {
    return this.ticks > 0 ? icon1Check(true) : icon1Check(false);
  }

  Widget icon2() {
    return this.ticks > 1 ? icon2Check(true) : icon2Check(false);
  }

  Widget icon3() {
    return this.ticks > 2 ? icon3Check(true) : icon3Check(false);
  }

  Widget icon4() {
    return this.ticks > 3 ? icon4Check(true) : icon4Check(false);
  }

  Widget icon1Check(bool isChecked) {
    return isChecked
        ? Icon(
            Icons.shopping_basket_outlined,
            color: Colors.greenAccent,
          )
        : Icon(
            Icons.shopping_basket_outlined,
            color: Colors.grey,
          );
  }

  Widget icon2Check(bool isChecked) {
    return isChecked
        ? Icon(
            Icons.today_outlined,
            color: Colors.greenAccent,
          )
        : Icon(
            Icons.today_outlined,
            color: Colors.grey,
          );
  }

  Widget icon3Check(bool isChecked) {
    return isChecked
        ? Icon(
            Icons.payment,
            color: Colors.greenAccent,
          )
        : Icon(
            Icons.payment,
            color: Colors.grey,
          );
  }

  Widget icon4Check(bool isChecked) {
    return isChecked
        ? Icon(
            Icons.delivery_dining,
            color: Colors.greenAccent,
          )
        : Icon(
            Icons.delivery_dining,
            color: Colors.grey,
          );
  }

  // -------------------------------- SPACER TOP ------------------------------------

  Widget spacerTop() {
    return Container(
      width: 66.0,
    );
  }

  // -------------------------------- TICKS ----------------------------------------

  Widget tick1() {
    return this.ticks > 0 ? tick(true) : tick(false);
  }

  Widget tick2() {
    return this.ticks > 1 ? tick(true) : tick(false);
  }

  Widget tick3() {
    return this.ticks > 2 ? tick(true) : tick(false);
  }

  Widget tick4() {
    return this.ticks > 3 ? tick(true) : tick(false);
  }

  Widget tick(bool isChecked) {
    return isChecked
        ? Icon(
            Icons.check_circle,
            color: Colors.greenAccent,
            size: 30,
          )
        : Icon(
            Icons.radio_button_unchecked,
            color: Colors.grey,
            size: 30,
          );
  }

  // -------------------------------- SPACER CENTER ---------------------------------
  Widget spacer() {
    return Container(
      width: 5.0,
    );
  }

  // -------------------------------- LINES ----------------------------------------

  Widget line1() {
    return this.ticks > 0 ? line(true) : line(false);
  }

  Widget line2() {
    return this.ticks > 1 ? line(true) : line(false);
  }

  Widget line3() {
    return this.ticks > 2 ? line(true) : line(false);
  }

  Widget line4() {
    return this.ticks > 3 ? line(true) : line(false);
  }

  Widget line(bool isChecked) {
    return isChecked
        ? Container(
            color: Colors.greenAccent,
            height: 5.0,
            width: 50,
          )
        : Container(
            color: Colors.grey,
            height: 5.0,
            width: 50,
          );
  }

// -------------------------------- TEXTS ----------------------------------------

  Widget text1() {
    return this.ticks > 0 ? text1Check(true) : text1Check(false);
  }

  Widget text2() {
    return this.ticks > 1 ? text2Check(true) : text2Check(false);
  }

  Widget text3() {
    return this.ticks > 2 ? text3Check(true) : text3Check(false);
  }

  Widget text4() {
    return this.ticks > 3 ? text4Check(true) : text4Check(false);
  }

  Widget text1Check(bool isChecked) {
    // String texto = 'Montar\nCesta';
    return isChecked
        ? Text(
            'Cesta\nMontada',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.greenAccent,
            ),
          )
        : Text(
            'Montar\nCesta',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          );
  }

  Widget text2Check(bool isChecked) {
    // String texto = 'Agendar\nEntrega';
    return isChecked
        ? Text(
            'Entrega\nAgendada',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.greenAccent,
            ),
          )
        : Text(
            'Agendar\nEntrega',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          );
  }

  Widget text3Check(bool isChecked) {
    // String texto = 'Efetuar\nPagamento';
    return isChecked
        ? Text(
            'Pagamento\nEfetuado',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.greenAccent,
            ),
          )
        : Text(
            'Efetuar\nPagamento',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          );
  }

  Widget text4Check(bool isChecked) {
    // String texto = 'Aguardar\nEntrega';
    return isChecked
        ? Text(
            'Entrega\nRecebida',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.greenAccent,
            ),
          )
        : Text(
            'Aguardar\nEntrega',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          );
  }

  // -------------------------------- SPACER TOP ------------------------------------

  Widget spacerBottom() {
    return Container(
      width: 40.0,
    );
  }
}

class OrderStatuScreen extends StatelessWidget {
  //
  CarouselSlider carouselSlider;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            color: Color.fromRGBO(93, 97, 115, 1),
            child: ScreenProgress(
              ticks: 4,
            ),
          ),
        ),
      ),
    );
  }
}

//-------------------------------------------------------------
/*
class OrderStatuScreen extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints(maxHeight: 160),
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.end,
              isFirst: true,
              indicatorStyle: IndicatorStyle(
                width: 40,
                height: 60,
                padding: const EdgeInsets.all(8),
                indicator: Icon(Icons.ac_unit),
              ),
              startChild: const _Child(
                text: "Don't Panic!",
                font: 'Bungee',
              ),
            ),
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.end,
              indicatorStyle: IndicatorStyle(
                width: 40,
                height: 60,
                padding: const EdgeInsets.symmetric(vertical: 8),
                drawGap: true,
                indicator: Container(
                  decoration: const BoxDecoration(
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '42',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              startChild: const _Child(
                text: 'So long, and thanks',
              ),
            ),
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.end,
              isLast: true,
              indicatorStyle: IndicatorStyle(
                width: 40,
                height: 60,
                padding: const EdgeInsets.all(8),
                indicator: Icon(Icons.ac_unit),
              ),
              startChild: const _Child(
                text: 'for all the fish !',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Child extends StatelessWidget {
  const _Child({
    Key key,
    this.text,
    this.font = 'Shrikhand',
  }) : super(key: key);

  final String text;
  final String font;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.amberAccent,
      constraints: const BoxConstraints(minHeight: 120),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.deepOrange,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
*/
