import 'package:flutter/material.dart';
import 'package:localfarm/Datas/farm_data.dart';

class FarmHeader extends StatelessWidget {
  final FarmData farmData;

  FarmHeader(this.farmData);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35.0),
      height: 200.0,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0, bottom: 10.0),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 5.0,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: NetworkImage(farmData.image))
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(farmData.name, style: TextStyle( fontWeight: FontWeight.w500, fontSize: 17),)
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("\$\$\$", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),),
                        Row(
                          children: <Widget>[
                            Text('4,2'),
                            Icon(Icons.star, color: Colors.yellow,)
                          ],
                        )

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
