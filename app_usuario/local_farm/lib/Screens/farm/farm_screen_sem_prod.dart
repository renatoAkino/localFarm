import 'package:flutter/material.dart';
import 'package:localfarm/Datas/farm_data.dart';
import 'package:localfarm/Screens/cart/cart_screen.dart';
import 'package:localfarm/Screens/cart/components/cart_icon.dart';

import 'profile_screen_tab.dart';
import 'store_screen_tab.dart';

class FarmScreenSemProd extends StatefulWidget {
  final FarmData farmData;
  FarmScreenSemProd(this.farmData);

  @override
  _FarmScreenSemProdState createState() => _FarmScreenSemProdState();
}

class _FarmScreenSemProdState extends State<FarmScreenSemProd>
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
      // backgroundColor: Colors.white,
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
                  // backgroundColor: Colors.grey[50],
                  backgroundColor: Colors.white,
                  elevation: 0,
                  expandedHeight: MediaQuery.of(context).size.height * 0.45,
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  top < 160
                                      ? Text("")
                                      : Container(
                                          padding: EdgeInsets.only(top: 8),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.07,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            // crossAxisAlignment:
                                            //     CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                widget.farmData.addres,
                                                // 'Sr. José da Silva',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.location_on,
                                                          color: Colors.green,
                                                          size: 15,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          '${widget.farmData.distance} km',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey[600],
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.turned_in,
                                                          color: Colors.green,
                                                          size: 15,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          widget.farmData
                                                              .followers
                                                              .toString(),
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey[600],
                                                            fontSize: 10,
                                                          ),
                                                          maxLines: 2,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Icon(
                                                          Icons.local_shipping,
                                                          size: 15,
                                                          // Icons.moped,
                                                          color: Colors.green,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          'Ter - Qui',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey[600],
                                                            fontSize: 10,
                                                          ),
                                                          maxLines: 2,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                ],
                              ),
                        background: Stack(
                          // fit: StackFit.expand,
                          children: [
                            Image.network(
                              widget.farmData.image,
                              // 'https://cdn2.f-cdn.com/contestentries/1756878/17693014/5e89d34a7b27c_thumb900.jpg',
                              fit: BoxFit.contain,
                              alignment: AlignmentDirectional.topEnd,
                              height: MediaQuery.of(context).size.height * 0.5,
                              // width: 300,
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.23,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  // COR DO FUNDO DAS INFOS
                                  color: Colors.white,
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                // color: Colors.blue,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  // title: Text(
                  //   widget.farmData.name,
                  //   style: TextStyle(color: Colors.green),
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
