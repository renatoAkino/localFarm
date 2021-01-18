import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:producerfarm/Controllers/routing_controller.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';

// /// Google Map in the background
// class CustomGoogleMap extends StatefulWidget {
//   RoutingController controller;
//   CustomGoogleMap({
//     Key key,
//     this.controller,
//   }) : super(key: key);

//   @override
//   _CustomGoogleMapState createState() => _CustomGoogleMapState();
// }

// class _CustomGoogleMapState extends State<CustomGoogleMap> {
//   GoogleMapController _mapController;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//       child: GoogleMap(
//         onMapCreated: onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: LatLng(-23.438620855027683, -46.53742358994361),
//         ),
//         mapType: MapType.normal,
//       ),
//     );
//   }

//   void onMapCreated(GoogleMapController ctlr) {
//     setState(() {
//       _mapController = ctlr;
//     });
//   }
// }
// // https://www.youtube.com/watch?v=opKKPMok1zc

//========================================================================
/// Google Map in the background
// class CustomGoogleMap extends StatelessWidget {
//   RoutingController controller;
//   CustomGoogleMap({
//     Key key,
//     this.controller,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//       // child: Image.network('https://i.stack.imgur.com/YDVJI.png',
//       child: Image.network(
//           'https://blog.angelengineering.com/content/images/2020/01/Screen-Shot-2020-01-15-at-2.09.45-PM.png',
//           fit: BoxFit.cover),
//     );
//   }
// }
//========================================================================

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class CustomGoogleMap extends StatelessWidget {
  RoutingController controller;
  CustomGoogleMap({
    Key key,
    this.controller,
  }) : super(key: key);
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    // PolylinePoints polylinePoints = PolylinePoints();
    // List<PointLatLng> result =
    //     polylinePoints.decodePolyline(controller.dados.routes[0].geometry);

    // List<LatLng> polylineCoordinates = [];

    // result.forEach((PointLatLng point) {
    //   polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    // });

    return Padding(
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          // Padding(
          //   padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          //   child: Text('This is a map that is showing (51.5, -0.9).'),
          // ),
          Flexible(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(
                    controller.firstLocation[0], controller.firstLocation[1]),
                zoom: 14.0,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                  // For example purposes. It is recommended to use
                  // TileProvider with a caching and retry strategy, like
                  // NetworkTileProvider or CachedNetworkTileProvider
                  tileProvider: NonCachingNetworkTileProvider(),
                ),
                MarkerLayerOptions(markers: controller.markers),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// print(result[0].latitude);

// var markers = <Marker>[
//   Marker(
//     width: 40.0,
//     height: 40.0,
//     point: LatLng(-23.438620855027683, -46.53742358994361),
//     builder: (ctx) => Container(
//       child: SvgPicture.asset('assets/icons/placeholder.svg'),
//     ),
//   ),
//   Marker(
//     width: 40.0,
//     height: 40.0,
//     point: LatLng(-23.4285211719474, -46.54286454392993),
//     builder: (ctx) => Container(
//       child: SvgPicture.asset('assets/icons/placeholder.svg'),
//     ),
//   ),
//   Marker(
//     width: 40.0,
//     height: 40.0,
//     point: LatLng(-23.43576626864311, -46.546855686214364),
//     builder: (ctx) => Container(
//       child: SvgPicture.asset('assets/icons/placeholder.svg'),
//     ),
//   ),
//   Marker(
//     width: 40.0,
//     height: 40.0,
//     point: LatLng(-23.433442382820278, -46.52659998800095),
//     builder: (ctx) => Container(
//       child: SvgPicture.asset('assets/icons/placeholder.svg'),
//     ),
//   ),
//   Marker(
//     width: 40.0,
//     height: 40.0,
//     point: LatLng(-23.44981553925481, -46.527945117333864),
//     builder: (ctx) => Container(
//       child: SvgPicture.asset('assets/icons/placeholder.svg'),
//     ),
//   ),
//   Marker(
//     width: 40.0,
//     height: 40.0,
//     point: LatLng(-23.443458330786086, -46.52455385945282),
//     builder: (ctx) => Container(
//       child: SvgPicture.asset('assets/icons/placeholder.svg'),
//     ),
//   ),
// ];
