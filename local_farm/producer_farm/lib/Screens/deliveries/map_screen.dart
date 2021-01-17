import 'package:flutter/material.dart';

import 'components/list_adresses.dart';
import 'components/open_google_maps.dart';

class MapRoutingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomGoogleMap(),
          DraggableScrollableSheet(
            initialChildSize: 0.30,
            minChildSize: 0.15,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: CustomScrollViewContent(),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Google Map in the background
class CustomGoogleMap extends StatelessWidget {
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

/// Content of the DraggableBottomSheet's child SingleChildScrollView
class CustomScrollViewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      margin: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: CustomInnerContent(),
      ),
    );
  }
}

class CustomInnerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 12),
        CustomDraggingHandle(),
        SizedBox(height: 5),
        CustomHeaderBottom(),
        SizedBox(height: 16),
        Divider(),
        SizedBox(height: 12),
        CustomFeaturedListsText(),
        SizedBox(height: 16),
      ],
    );
  }
}

class CustomDraggingHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 30,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
    );
  }
}

class CustomHeaderBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Rota de Entrega",
        style: TextStyle(fontSize: 25, color: Colors.black87),
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("7 entregas\t\t\t\t\t\t~25km"),
          // Text("Retorno às 18:32 (03h22m de percurso)"),
          SizedBox(
            height: 2,
          ),
          Text("03h22m de percurso"),
        ],
      ),
      trailing: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green,
        ),
        child: FlatButton(
          onPressed: () {
            try {
              MapUtils.openMap(-23.43894025948765, -46.53733859315962);
            } catch (e) {
              print('Erro ao conectar Maps');
            }
          },
          child: Center(
            child: Text(
              'INICIAR',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
