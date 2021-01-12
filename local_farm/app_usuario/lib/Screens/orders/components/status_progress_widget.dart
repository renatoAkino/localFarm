import 'package:flutter/material.dart';

class StatusProgressWidget extends StatelessWidget {
  // double deviceHeight(BuildContext context) =>
  //     MediaQuery.of(context).size.height;

  // double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  final int index;
  final bool dark;
  // final int lines;

  StatusProgressWidget({@required this.index, this.dark});

  Color colorFundo = Colors.white;
  Color colorUnselected = Colors.grey[300];
  Color colorSelected = Colors.lightGreen[700];

  @override
  Widget build(BuildContext context) {
    if (dark == true) {
      // colorFundo = Color.fromRGBO(93, 97, 115, 1);
      // colorFundo = Color.fromRGBO(240, 239, 225, 1);
      colorFundo = Colors.grey[50];
      colorUnselected = Colors.grey;
      colorSelected = Colors.green;
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          // color: Color.fromRGBO(93, 97, 115, 1),
          // color: Colors.green[50],
          color: colorFundo,
          child: Column(
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
                  spacerBottom(context),
                  text2(),
                  spacerBottom(context),
                  text3(),
                  spacerBottom(context),
                  text4(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

// -------------------------------- ICONS ----------------------------------------

  Widget icon1() {
    return this.index > 0 ? icon1Check(true) : icon1Check(false);
  }

  Widget icon2() {
    return this.index > 1 ? icon2Check(true) : icon2Check(false);
  }

  Widget icon3() {
    return this.index > 2 ? icon3Check(true) : icon3Check(false);
  }

  Widget icon4() {
    return this.index > 3 ? icon4Check(true) : icon4Check(false);
  }

  Widget icon1Check(bool isChecked) {
    return isChecked
        ? Icon(
            Icons.shopping_basket_outlined,
            // color: Colors.greenAccent,
            color: colorSelected,
          )
        : Icon(
            Icons.shopping_basket_outlined,
            color: colorUnselected,
          );
  }

  Widget icon2Check(bool isChecked) {
    return isChecked
        ? Icon(
            Icons.today_outlined,
            // color: Colors.greenAccent,
            color: colorSelected,
          )
        : Icon(
            Icons.today_outlined,
            color: colorUnselected,
          );
  }

  Widget icon3Check(bool isChecked) {
    return isChecked
        ? Icon(
            Icons.payment,
            // color: Colors.greenAccent,
            color: colorSelected,
          )
        : Icon(
            Icons.payment,
            color: colorUnselected,
          );
  }

  Widget icon4Check(bool isChecked) {
    return isChecked
        ? Icon(
            Icons.delivery_dining,
            // color: Colors.greenAccent,
            color: colorSelected,
          )
        : Icon(
            Icons.delivery_dining,
            color: colorUnselected,
          );
  }

  // -------------------------------- SPACER TOP ------------------------------------

  Widget spacerTop() {
    return Container(
      width: 66.0,
    );
  }

  // -------------------------------- index ----------------------------------------

  Widget tick1() {
    return this.index > 0 ? tick(true) : tick(false);
  }

  Widget tick2() {
    return this.index > 1 ? tick(true) : tick(false);
  }

  Widget tick3() {
    return this.index > 2 ? tick(true) : tick(false);
  }

  Widget tick4() {
    return this.index > 3 ? tick(true) : tick(false);
  }

  Widget tick(bool isChecked) {
    return isChecked
        ? Icon(
            Icons.check_circle,
            // color: Colors.greenAccent,
            color: colorSelected,
            size: 30,
          )
        : Icon(
            Icons.radio_button_unchecked,
            color: colorUnselected,
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
    return this.index > 0 ? line(true) : line(false);
  }

  Widget line2() {
    return this.index > 1 ? line(true) : line(false);
  }

  Widget line3() {
    return this.index > 2 ? line(true) : line(false);
  }

  Widget line4() {
    return this.index > 3 ? line(true) : line(false);
  }

  Widget line(bool isChecked) {
    return isChecked
        ? Container(
            // color: Colors.greenAccent,
            color: colorSelected,
            height: 5.0,
            width: 50,
          )
        : Container(
            color: colorUnselected,
            height: 5.0,
            width: 50,
          );
  }

// -------------------------------- TEXTS ----------------------------------------

  Widget text1() {
    return this.index > 0 ? text1Check(true) : text1Check(false);
  }

  Widget text2() {
    return this.index > 1 ? text2Check(true) : text2Check(false);
  }

  Widget text3() {
    return this.index > 2 ? text3Check(true) : text3Check(false);
  }

  Widget text4() {
    return this.index > 3 ? text4Check(true) : text4Check(false);
  }

  Widget text1Check(bool isChecked) {
    // String texto = 'Montar\nCesta';
    return isChecked
        ? Text(
            'Cesta\nMontada',
            textAlign: TextAlign.center,
            style: TextStyle(
              // color: Colors.greenAccent,
              color: colorSelected,
            ),
          )
        : Text(
            'Montar\nCesta',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colorUnselected,
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
              // color: Colors.greenAccent,
              color: colorSelected,
            ),
          )
        : Text(
            'Agendar\nEntrega',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colorUnselected,
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
              // color: Colors.greenAccent,
              color: colorSelected,
            ),
          )
        : Text(
            'Efetuar\nPagamento',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colorUnselected,
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
              // color: Colors.greenAccent,
              color: colorSelected,
            ),
          )
        : Text(
            'Aguardar\nEntrega',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colorUnselected,
            ),
          );
  }

  // -------------------------------- SPACER TOP ------------------------------------

  Widget spacerBottom(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.05,
    );
  }
}
