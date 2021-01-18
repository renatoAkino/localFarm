import 'package:flutter/material.dart';
import 'package:producerfarm/Controllers/routing_controller.dart';
import 'package:producerfarm/Screens/deliveries/components/list_adresses.dart';

import 'launcher_google_maps.dart';

/// Content of the DraggableBottomSheet's child SingleChildScrollView
class CustomScrollViewContent extends StatelessWidget {
  RoutingController controller;
  CustomScrollViewContent({
    Key key,
    this.controller,
  }) : super(key: key);
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
        child: Column(
          children: <Widget>[
            SizedBox(height: 12),
            CustomDraggingHandle(),
            SizedBox(height: 5),
            CustomHeaderBottom(controller: controller),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 12),
            CustomFeaturedListsText(
              controller: controller,
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class CustomHeaderBottom extends StatelessWidget {
  RoutingController controller;
  CustomHeaderBottom({
    Key key,
    this.controller,
  }) : super(key: key);
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
          // Text("7 entregas\t\t\t\t\t\t~25km"),
          Text("${controller.numJobs} entregas\t\t\t\t\t\t~25km"),
          SizedBox(
            height: 2,
          ),
          Text("${controller.totalDur} de percurso"),
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
            var lat = controller.firstLocation[0];
            var lon = controller.firstLocation[1];
            try {
              MapUtils.openMap(lat, lon);
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

// List<Step> spr = <Step>[
//   // const Step( title:  ,'SubTitle1', 'This is Content', state: StepState.indexed, true)

//   Step(
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Flexible(
//             child: Text(
//               'Rua José de Alencar, 38',
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//           SizedBox(height: 5),
//           Text(
//             '9:53',
//             style: TextStyle(fontSize: 20),
//           ),
//         ],
//       ),
//       subtitle: Text('07132-580, Jd Drummond, Guarulhos'),
//       content: Padding(
//         padding: const EdgeInsets.only(bottom: 15.0),
//         child: Container(
//           // color: Colors.grey[100],
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Cliente',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     'José Roberto',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Horário Disponível',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     '09:00 - 12:00',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Contato',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     '(11)98457-6458',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ],
//               ),
//               // SizedBox(
//               //   height: 10,
//               // ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Pedido',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     'A54dXf45697',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       state: StepState.indexed,
//       isActive: true),

//   Step(
//       title: const Text('Hello2'),
//       subtitle: Text('SubTitle2'),
//       content: const Text('This is Content2'),
//       state: StepState.indexed,
//       isActive: true),

//   Step(
//       title: const Text('Hello3'),
//       subtitle: Text('SubTitle3'),
//       content: const Text('This is Content3'),
//       state: StepState.indexed,
//       isActive: true),

//   Step(
//       title: const Text('Hello4'),
//       subtitle: Text('SubTitle4'),
//       content: const Text('This is Content4'),
//       state: StepState.indexed,
//       isActive: true),

//   Step(
//       title: const Text('Hello5'),
//       subtitle: Text('SubTitle5'),
//       content: const Text('This is Content5'),
//       state: StepState.indexed,
//       isActive: true),

//   Step(
//       title: const Text('Hello6'),
//       subtitle: Text('SubTitle6'),
//       content: const Text('This is Content6'),
//       state: StepState.indexed,
//       isActive: true),

//   Step(
//       title: const Text('Hello7'),
//       subtitle: Text('SubTitle7'),
//       content: const Text('This is Content7'),
//       state: StepState.indexed,
//       isActive: true),
// ];
