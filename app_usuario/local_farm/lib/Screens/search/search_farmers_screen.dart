import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Datas/post_data.dart';
import 'package:localfarm/Datas/product_data.dart';
import 'package:localfarm/Screens/feed/components/feed_tile.dart';
import 'package:localfarm/widgets/products_tile.dart';

import 'package:filter_list/filter_list.dart';

import 'components/farmers_list.dart';

class SearchFarmersScreen extends StatefulWidget {
  @override
  _SearchFarmersScreenState createState() => _SearchFarmersScreenState();
}

class _SearchFarmersScreenState extends State<SearchFarmersScreen> {
  String _search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: filterBarWidget(),
      ),

      // A barra de busca foi ocultada pois tava dando bug

      // body: Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 15),
      //   child: ListView(
      //     children: <Widget>[
      // SEARCH
      // Container(
      //   height: 50,
      //   child: TextField(
      //     decoration: InputDecoration(
      //       prefixIcon: Icon(Icons.search),
      //       border:
      //           OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      //     ),
      //     onChanged: (text) {
      //       setState(() {
      //         if (text != null && text != "") {
      //           _search = text;
      //         }
      //       });
      //     },
      //   ),
      // ),

      // FILTER BUTTONS
      // SizedBox(
      //   height: 5,
      // ),

      //CONTENT
      // FarmersList(filterBy),
      body: FarmersList(),
      // ],
      // ),
      // ),
    );
  }

  filterBarWidget() {
    //
    // Essa lista serve para abrir o Dialog do filtro dos dias
    // https://pub.dev/packages/filter_list
    List<String> countList = [
      "Segunda",
      "Terça",
      "Quarta",
      "Quinta",
      "Sexta",
      "Sábado",
      "Domingo",
    ];

    List<String> selectedCountList = [];

    void _openFilterDialog() async {
      await FilterListDialog.display(context,
          allTextList: countList,
          height: 280,
          borderRadius: 10,
          headlineText: "Dias da Semana",
          selectedTextBackgroundColor: Colors.green,
          closeIconColor: Colors.green,
          allResetButonColor: Colors.green,
          applyButonTextBackgroundColor: Colors.green,
          hideSearchField: true,
          hideSelectedTextCount: true,
          selectedTextList: selectedCountList, onApplyButtonClick: (list) {
        if (list != null) {
          setState(() {
            selectedCountList = List.from(list);
          });
        }
        Navigator.pop(context);
      });
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Row(
            children: [
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.green)),
                color: Colors.green,
                textColor: Colors.white,
                padding: EdgeInsets.all(8.0),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.my_location,
                      size: 15,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "proximidade".toUpperCase(),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.green)),
                color: Colors.transparent,
                textColor: Colors.green,
                padding: EdgeInsets.all(8.0),
                onPressed: () {
                  _openFilterDialog();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 15,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "entrega".toUpperCase(),
                    ),
                  ],
                ),
              ),
              // SizedBox(width: 10),
              // FlatButton(
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(18.0),
              //       side: BorderSide(color: Colors.green)),
              //   onPressed: () {},
              //   color: Colors.transparent,
              //   textColor: Colors.green,
              //   child: Row(
              //     children: [
              //       Icon(
              //         Icons.attach_money,
              //         size: 15,
              //       ),
              //       SizedBox(width: 10),
              //       Text(
              //         "preço".toUpperCase(),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(width: 10),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.green)),
                color: Colors.transparent,
                textColor: Colors.green,
                padding: EdgeInsets.all(8.0),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.turned_in,
                      size: 15,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "popular".toUpperCase(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
