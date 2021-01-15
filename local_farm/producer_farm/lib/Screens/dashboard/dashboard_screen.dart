import 'package:flutter/material.dart';
import 'package:producerfarm/Models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../Models/user_model.dart';
import '../login_screen.dart';
import 'components/floating_card_dashboard.dart';
import 'components/sales_chart.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listInfoCards = [
      {'title': 'Vendas\nHoje', 'count': 3, 'page': 'pagina'},
      {'title': 'Vendas nos\núltimos 7 dias', 'count': 15, 'page': 'pagina'},
      // {'title': 'Em Rota\nde Entrega', 'count': 42, 'page': 'pagina'},
      // {'title': 'Em Rota\nde Entrega', 'count': 42, 'page': 'pagina'},
    ];
    Size size = MediaQuery.of(context).size;
    //
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        if (model.isLoggedin()) {
          print(model.firebaseUser.uid);
        }
        return Scaffold(
          // backgroundColor: Colors.grey[50],
          backgroundColor: Colors.white,
          // appBar: HomeAppBar(),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            // leading: Image.asset('local_farm/producer_farm/assets/logo.png'),
            elevation: 1.5,
            title: Text(
              'Dashboard',
              style: TextStyle(
                // fontSize: 25,
                color: Colors.black87,
              ),
            ),
            actions: <Widget>[],
          ),
          body: model.isLoggedin()
              ? Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: size.height * 0.04, left: 15),
                      child: Row(
                        children: [
                          Text(
                            'Vendas Recentes',
                            // '',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 18, color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.10, left: 15, right: 15),
                      child: GridView.builder(
                          itemCount: listInfoCards.length,
                          physics: NeverScrollableScrollPhysics(),
                          // itemCount: 2,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 25,
                            mainAxisSpacing: 20,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            return FloatingCardDashboard(
                                listInfoCards: listInfoCards, index: index);
                          }),
                    ),
                    // Text(model.userData.farmData.farmId),
                    // Text(model.userData.farmData.name),
                    // Text(model.userData.farmData.distance.toString()),
                    // Text(model.userData.farmData.image),
                    // Text(model.userData.farmData.followers.toString()),
                    SalesChart(),
                    Padding(
                      padding:
                          EdgeInsets.only(top: size.height * 0.39, left: 15),
                      child: Row(
                        children: [
                          Text(
                            'Faturamento Mensal',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 18, color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Container(
                    height: 30,
                    width: 90,
                    child: FlatButton(
                      color: Colors.green,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        "Faça Login",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
