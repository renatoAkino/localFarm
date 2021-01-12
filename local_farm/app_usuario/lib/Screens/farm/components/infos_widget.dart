import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localfarm/Datas/farm_data.dart';
import 'package:localfarm/Screens/farm/components/selos_widget.dart';

class FarmInfosWidget extends StatelessWidget {
  final FarmData farm;
  double top;
  FarmInfosWidget(this.farm, this.top);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        top < MediaQuery.of(context).size.height * 0.3
            ? Text("")
            : Container(
                // color: Colors.teal,
                // padding: EdgeInsets.only(top: 3),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.19,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment:
                  //     CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          farm.name,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          farm.addres,
                          // 'Sr. José da Silva',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                    SelosFarmWidget(farm),
                    // Divider(height: 5),
                    Container(color: Colors.green[50], height: 1),
                    infosFarmer(),
                    // Divider(height: 5),
                  ],
                ),
              ),
      ],
    );
  }

  Row infosFarmer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.green,
                    size: 15,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    '${farm.distance} km',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    'distância',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.turned_in,
                    color: Colors.green,
                    size: 15,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    farm.followers.toString(),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 10,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
              Text(
                'seguidores',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 8,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.local_shipping,
                    size: 15,
                    // Icons.moped,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    'Ter-Qui',
                    // '28 jan',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 10,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
              Text(
                'entregas',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 8,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
