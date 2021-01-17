import 'package:flutter/material.dart';
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

/// Google Map in the background
class CustomGoogleMap extends StatelessWidget {
  RoutingController controller;
  CustomGoogleMap({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      // child: Image.network('https://i.stack.imgur.com/YDVJI.png',
      child: Image.network(
          'https://blog.angelengineering.com/content/images/2020/01/Screen-Shot-2020-01-15-at-2.09.45-PM.png',
          fit: BoxFit.cover),
    );
  }
}
