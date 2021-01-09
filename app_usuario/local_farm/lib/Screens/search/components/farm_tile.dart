import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Datas/farm_data.dart';
import 'package:localfarm/Screens/farm/farm_screen.dart';
import 'package:localfarm/Screens/store_screen.dart';

class FarmTile extends StatelessWidget {
  final FarmData farm;

  FarmTile(this.farm);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => CustomSliverHeaderDemo()));
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FarmScreen(farm),
            ),
          );
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => StoreScreen(farm)));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // color: Colors.green[50],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 3.2,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              // topLeft: Radius.circular(10.0),
                              // topRight: Radius.circular(10.0),
                              // bottomLeft: Radius.circular(10.0),
                              // bottomRight: Radius.circular(20.0),
                              ),
                          image: DecorationImage(
                              image: NetworkImage(farm.image),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -10.0,
                    bottom: 0.0,
                    child: RawMaterialButton(
                      onPressed: () {},
                      fillColor: Colors.white,
                      shape: CircleBorder(),
                      elevation: 4.0,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          // isFav ? Icons.favorite : Icons.favorite_border,
                          Icons.turned_in_not,
                          color: Colors.green,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 0, right: 10, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              farm.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Estrada de Ouro Fino, Goiás',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                endIndent: 40,
                indent: 40,
                height: 20,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15.0, top: 5, bottom: 5, right: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey[400],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '15 km',
                          style: TextStyle(color: Colors.grey),
                          maxLines: 2,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.turned_in,
                          color: Colors.grey[400],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '584',
                          style: TextStyle(color: Colors.grey),
                          maxLines: 2,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.local_shipping,
                          // Icons.moped,
                          color: Colors.grey[400],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Entregas: Ter - Qui',
                          style: TextStyle(color: Colors.grey),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
