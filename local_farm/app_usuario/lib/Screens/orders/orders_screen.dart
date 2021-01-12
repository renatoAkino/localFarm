import 'package:flutter/material.dart';

import 'components/order_list.dart';
// import 'package:newsupply1/controllers/Order_controller.dart';
// import 'package:newsupply1/widgets/appbar_default.dart';
// import 'package:newsupply1/pages/Orders/components/Order_card.dart';

class OrderPage extends StatelessWidget {
  // final controller = OrderController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          bottom: TabBar(
              labelStyle: TextStyle(fontSize: 16),
              labelColor: Colors.green[600],
              isScrollable: false,
              indicatorColor: Colors.green,
              indicatorWeight: 2.0,
              tabs: [
                // bottom: TabBar(labelColor: Colors.teal, isScrollable: false, tabs: [
                Tab(text: 'EM ANDAMENTO'),
                Tab(text: 'FINALIZADOS'),
              ]),
        ),
        body: TabBarView(
          children: [
            OrdersList(status: 'Em Andamento'),
            OrdersList(status: 'Finalizado'),
            // ExpandedTile(),
          ],
        ),
      ),
    );
  }
}
