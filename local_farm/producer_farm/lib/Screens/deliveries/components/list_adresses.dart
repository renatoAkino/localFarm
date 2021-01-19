import 'package:flutter/material.dart';
import 'package:producerfarm/Controllers/routing_controller.dart';
import 'package:producerfarm/Datas/order_data.dart';

import 'launcher_google_maps.dart';

class CustomFeaturedListsText extends StatefulWidget {
  // List<Step> spr;
  RoutingController controller;
  List<OrderData> orderDataList;
  CustomFeaturedListsText({
    Key key,
    // this.spr,
    this.controller,
    this.orderDataList,
  }) : super(key: key);
  @override
  _CustomFeaturedListsTextState createState() =>
      _CustomFeaturedListsTextState();
}

class _CustomFeaturedListsTextState extends State<CustomFeaturedListsText> {
  List<Step> spr = [];

  int _currentstep = 0;

  void _movetonext() {
    setState(
      () {
        if (_currentstep < spr.length - 1) {
          _currentstep++;
        } else {
          _currentstep = 0;
        }
      },
    );
  }

  void _movetostart() {
    setState(() {
      if (_currentstep > 0) {
        _currentstep--;
      } else {
        _currentstep = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    spr = widget.controller.spr;
    return Theme(
        data: ThemeData(
            accentColor: Colors.green,
            primarySwatch: Colors.green,
            colorScheme: ColorScheme.light(primary: Colors.green)),
        child: Stepper(
          physics: NeverScrollableScrollPhysics(),
          steps: spr,
          type: StepperType.vertical,
          currentStep: _currentstep,
          onStepContinue: _movetonext,
          onStepCancel: _movetostart,
          // onStepTapped: (int step) => setState(() => _currentstep = step),
          controlsBuilder: (BuildContext context,
              {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    double lat = widget.controller.dados.routes[0]
                        .steps[_currentstep + 1].location[0];
                    double lon = widget.controller.dados.routes[0]
                        .steps[_currentstep + 1].location[1];
                    // double lat = widget.orderDataList[_currentstep].location[0];
                    // double lon = widget.orderDataList[_currentstep].location[1];

                    try {
                      MapUtils.openMap(lat, lon);
                    } catch (e) {
                      print('Erro ao conectar Maps');
                    }
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.navigation,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'INICIAR',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: onStepContinue,
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Finalizar',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  child: IconButton(
                    onPressed: onStepCancel,
                    icon: Icon(
                      Icons.arrow_circle_up,
                      color: Colors.grey,
                    ),
                  ),
                  visible: _currentstep > 0,
                ),
              ],
            );
          },
        ));
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
