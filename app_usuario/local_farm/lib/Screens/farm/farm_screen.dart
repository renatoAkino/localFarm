import 'package:flutter/material.dart';
import 'package:localfarm/Datas/farm_data.dart';
import 'package:localfarm/Screens/cart/cart_screen.dart';
import 'package:localfarm/Screens/cart/components/cart_icon.dart';

import 'profile_screen_tab.dart';
import 'store_screen_tab.dart';

class FarmScreen extends StatefulWidget {
  final FarmData farmData;
  FarmScreen(this.farmData);

  @override
  _FarmScreenState createState() => _FarmScreenState();
}

class _FarmScreenState extends State<FarmScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverSafeArea(
                top: false,
                sliver: SliverAppBar(
                  actions: <Widget>[CartIconWidget()],
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  centerTitle: true,
                  pinned: true,
                  // snap: true,
                  // floating: true,
                  primary: true,
                  forceElevated: innerBoxIsScrolled,
                  backgroundColor: Colors.grey[50],
                  elevation: 0,
                  expandedHeight: MediaQuery.of(context).size.height * 0.42,
                  flexibleSpace: LayoutBuilder(
                    builder: (context, constraints) {
                      var top = constraints.biggest.height;
                      // print(top);
                      return FlexibleSpaceBar(
                        centerTitle: true,
                        titlePadding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.07),
                        title: top < 110
                            ? Text(
                                this.widget.farmData.name,
                                style: TextStyle(color: Colors.green),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    this.widget.farmData.name,
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  top < 140
                                      ? Text("")
                                      : Text(
                                          'Sr. João dos Santos',
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 12,
                                          ),
                                        ),
                                ],
                              ),
                        background: Stack(
                          // fit: StackFit.expand,
                          children: [
                            Image.network(
                              widget.farmData.image,
                              fit: BoxFit.cover,
                              // height: 300,
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.25,
                              child: Container(
                                // child: Column(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Text(
                                //       this.widget.farmData.name,
                                //       style: TextStyle(
                                //         color: Colors.grey[800],
                                //         fontSize: 20,
                                //         fontWeight: FontWeight.w700,
                                //       ),
                                //     ),
                                //     Text(
                                //       'Sr. João dos Santos ',
                                //       style: TextStyle(
                                //         color: Colors.grey[600],
                                //         fontSize: 16,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.grey[50],
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                // color: Colors.blue,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            Positioned(
                              right: MediaQuery.of(context).size.width * 0.35,
                              bottom: MediaQuery.of(context).size.height * 0.14,
                              child: Container(
                                width: 120.0,
                                height: 120.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/farmer.jpeg'),
                                  ),
                                  border: new Border.all(
                                    color: Colors.grey[100],
                                    width: 4.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  // title: Text(
                  //   widget.farmData.name,
                  //   style: TextStyle(color: Colors.grey[600]),
                  // ),
                  bottom: TabBar(
                    labelStyle: TextStyle(fontSize: 16),
                    labelColor: Colors.green[600],
                    indicatorColor: Colors.green,
                    controller: this.tabController,
                    tabs: <Widget>[
                      Tab(text: 'Loja'),
                      Tab(text: 'Perfil'),
                    ],
                  ),
                ),
              ),
            ),
            // SliverPersistentHeader(
            //   pinned: true,
            //   delegate: StickyTabBarDelegate(
            //     child: TabBar(
            //       labelStyle: TextStyle(fontSize: 16),
            //       labelColor: Colors.green[600],
            //       indicatorColor: Colors.green,
            //       controller: this.tabController,
            //       tabs: <Widget>[
            //         Tab(text: 'Loja'),
            //         Tab(text: 'Perfil'),
            //       ],
            //     ),
            //   ),
            // ),
            // SliverFillRemaining(
            //   child: TabBarView(
            //     controller: this.tabController,
            //     children: <Widget>[
            //       StoreScreenTab(widget.farmData),
            //       ProfileScreenTab(widget.farmData),
            //     ],
            //   ),
            // ),
          ];
        },
        body: TabBarView(
          controller: this.tabController,
          children: <Widget>[
            StoreScreenTab(widget.farmData),
            ProfileScreenTab(widget.farmData),
            // ProfileScreenTab(),
          ],
        ),
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
