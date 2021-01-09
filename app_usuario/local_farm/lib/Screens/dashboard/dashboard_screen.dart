import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localfarm/tmp/categories.dart';
import 'package:localfarm/tmp/foods.dart';
import 'package:localfarm/Screens/dashboard/components/dashboard_category.dart';
import 'package:localfarm/Screens/dashboard/components/dashboard_grid_product.dart';
import 'package:localfarm/Screens/dashboard/components/dashboard_promos.dart';
import 'package:localfarm/Screens/dashboard/components/dashboard_slider_item.dart';
import 'package:localfarm/widgets/dashboad_top_feeds.dart';
import 'package:localfarm/widgets/feed_tile.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with AutomaticKeepAliveClientMixin<DashboardScreen> {
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // shrinkWrap: true,
            // physics: ClampingScrollPhysics(),
            children: <Widget>[
              ImageCarousel(),
              SizedBox(height: 20.0),

              Text(
                "Categorias",
                style: TextStyle(
                  fontSize: 23,
                  // fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10.0),
              // SvgPicture.asset(
              //   categoriesSvg[0][1],
              //   placeholderBuilder: (context) => CircularProgressIndicator(),
              //   height: 18.0,
              // ),
              Container(
                height: 65.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categoriesSvg == null ? 0 : categoriesSvg.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map cat = categoriesSvg[index];
                    // print(cat['icon']);
                    return HomeCategory(
                      icon: cat['icon'],
                      title: cat['name'],
                      // items: cat['items'].toString(),
                      isHome: true,
                    );
                  },
                ),
              ),

              SizedBox(height: 20.0),

              Text(
                "Próxima Encomenda",
                style: TextStyle(
                  fontSize: 23,
                  // fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                elevation: 1.5,
                // color: Colors.lightGreen,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      child: Center(
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/farmer2.jpeg'),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            height: 40,
                            width: 40,
                          ),
                          title: Text(
                            'Sr. João dos Santos',
                            style: TextStyle(
                                // color: Colors.white,
                                ),
                          ),
                          subtitle: Text(
                            'Fazenda Atalaia',
                            style: TextStyle(
                                // color: Colors.grey[100],
                                ),
                          ),
                          trailing: Container(
                            height: 40,
                            width: 40,
                            child: Icon(
                              Icons.arrow_right,
                              color: Colors.green,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      // height: MediaQuery.of(context).size.width * 0.6,
                      endIndent: 40,
                      indent: 40,
                      height: 10,
                      // color: Colors.white,
                    ),
                    Container(
                      height: 70,
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.access_time,
                            // color: Colors.white,
                            color: Colors.green,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sexta, 08 de Janeiro',
                                style: TextStyle(
                                    // color: Colors.white,
                                    ),
                              ),
                              Text(
                                '8:00 - 10:00',
                                style: TextStyle(
                                    // color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.0),

              Text(
                "Destaques",
                style: TextStyle(
                  fontSize: 23,
                  // fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10.0),
              //Slider Here
              TopFeedsWidget(),
//             Column(
//               children: [
//                 CarouselSlider(
//                   height: MediaQuery.of(context).size.height / 2.4,
//                   items: map<Widget>(
//                     foods,
//                     (index, i) {
//                       Map food = foods[index];
//                       return SliderItem(
//                         img: food['img'],
//                         isFav: false,
//                         name: food['name'],
//                         rating: 5.0,
//                         raters: 23,
//                       );
//                     },
//                   ).toList(),
//                   autoPlay: true,
// //                enlargeCenterPage: true,
//                   viewportFraction: 1.0,
// //              aspectRatio: 2.0,
//                   onPageChanged: (index) {
//                     setState(() {
//                       _current = index;
//                     });
//                   },
//                 ),
//               ],
//             ),

              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Recomendados",
                    style: TextStyle(
                      fontSize: 23,
                      // fontWeight: FontWeight.w800,
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      // "View More",
                      "",
                      style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 0.0),

              GridView.builder(
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.25),
                ),
                itemCount: foods == null ? 0 : foods.length,
                itemBuilder: (BuildContext context, int index) {
//                Food food = Food.fromJson(foods[index]);
                  Map food = foods[index];
//                print(foods);
//                print(foods.length);
                  return GridProduct(
                    img: food['img'],
                    isFav: false,
                    name: food['name'],
                    rating: 5.0,
                    raters: 23,
                  );
                },
              ),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class TopFeeds {}
