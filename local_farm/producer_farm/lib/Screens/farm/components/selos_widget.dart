import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:producerfarm/Datas/farm_data.dart';

class SelosFarmWidget extends StatelessWidget {
  final FarmData farm;
  SelosFarmWidget(this.farm);

  var listaSelos = [
    {'selo': 'assets/icons/organic.svg', 'title': 'Produtor\nOrgânico'},
    {'selo': 'assets/icons/family.svg', 'title': 'Agricultura\nFamiliar'},
    {'selo': 'assets/icons/planting.svg', 'title': 'Trabalho\nManual'},
    {
      'selo': 'assets/icons/hydroponic-gardening.svg',
      'title': 'Produtor\nHidropônico'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        seloTile(listaSelos[0]['selo'], listaSelos[0]['title']),
        seloTile(listaSelos[1]['selo'], listaSelos[1]['title']),
        seloTile(listaSelos[2]['selo'], listaSelos[2]['title']),
        seloTile(listaSelos[3]['selo'], listaSelos[3]['title']),
      ],
    );
  }

  Column seloTile(String selo, String titulo) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 3, left: 10.0, right: 10.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(5)),
            height: 60,
            width: 60,
            margin: const EdgeInsets.only(bottom: 2.0),
            padding: const EdgeInsets.all(5.0),
            child: SvgPicture.asset(
              selo,
              color: Colors.green,
              // height: 24,
              // width: 24,
            ),
          ),
        ),
        Text(
          titulo,
          style: TextStyle(
            color: Colors.green,
            fontSize: 9,
          ),
        )
      ],
    );
  }
}
