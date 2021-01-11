import 'package:flutter/material.dart';
import 'package:localfarm/Datas/farm_data.dart';
import 'package:localfarm/Screens/feed/feed_screen.dart';

class ProfileScreenTab extends StatefulWidget {
  final FarmData farmData;
  ProfileScreenTab(this.farmData);

  @override
  _ProfileScreenTabState createState() => _ProfileScreenTabState();
}

class _ProfileScreenTabState extends State<ProfileScreenTab> {
  @override
  Widget build(BuildContext context) {
    return FeedScreen();
  }
}
