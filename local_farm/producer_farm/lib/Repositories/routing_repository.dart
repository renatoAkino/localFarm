import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:producerfarm/Datas/routing_data.dart';

class RoutingRepository {
  // loadJson() async {
  //   String data = await rootBundle.loadString('assets/json/keyboard.json');
  //   var jsonResult = json.decode(data);
  //   print(jsonResult);
  // }

  static Future<Routing> getRoute(String body) async {
    var url = "http://solver.vroom-project.org";

    var header = {
      "Content-Type": "application/json",
      'Accept': 'application/json',
    };

    // var body = jsonDecode(jsonBody);

/*
    print(body);

    final response = await http.post(url, headers: header, body: body);

    print(response);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map decodeResp = json.decode(response.body);

    Routing routing = Routing.fromJson(decodeResp);
*/

    return routing;
  }
}

Routing routing = Routing(
  code: 0,
  summary: Summary(
      cost: 11045,
      unassigned: 0,
      delivery: [0],
      pickup: [0],
      service: 1200,
      duration: 11045,
      waitingTime: 0,
      priority: 0,
      violations: [],
      computingTimes: ComputingTimes(loading: 6, solving: 0),
      amount: [0]),
  routes: [
    Routes(
      vehicle: 1,
      cost: 11045,
      delivery: [0],
      amount: [0],
      pickup: [0],
      service: 1200,
      duration: 11045,
      waitingTime: 0,
      priority: 0,
      steps: [
        Steps(
          type: "start",
          location: [-23.438620855027683, -46.53742358994361],
          service: 0,
          waitingTime: 0,
          load: [0],
          // arrival: Timestamp.fromMillisecondsSinceEpoch(1600416000),
          arrival: 1600416000,
          duration: 0,
          violations: [],
        ),
        Steps(
          type: "job",
          location: [-23.4285211719474, -46.54286454392993],
          id: 6,
          service: 300,
          waitingTime: 0,
          job: 6,
          load: [0],
          // arrival: Timestamp.fromMillisecondsSinceEpoch(1600418710),
          arrival: 1600418710,
          duration: 2710,
          violations: [],
        ),
        Steps(
          type: "job",
          location: [-23.43576626864311, -46.546855686214364],
          id: 1,
          service: 300,
          waitingTime: 0,
          job: 1,
          load: [0],
          // arrival: Timestamp.fromMillisecondsSinceEpoch(1600423395),
          arrival: 1600423395,
          duration: 7095,
          violations: [],
        ),
        Steps(
          type: "job",
          location: [-23.433442382820278, -46.52659998800095],
          id: 2,
          service: 300,
          waitingTime: 0,
          job: 2,
          load: [0],
          // arrival: Timestamp.fromMillisecondsSinceEpoch(1600424746),
          arrival: 1600424746,
          duration: 8146,
          violations: [],
        ),
        Steps(
          type: "job",
          location: [-23.44981553925481, -46.527945117333864],
          id: 5,
          service: 300,
          waitingTime: 0,
          job: 5,
          load: [0],
          // arrival: Timestamp.fromMillisecondsSinceEpoch(1600426546),
          arrival: 1600426546,
          duration: 9646,
          violations: [],
        ),
        Steps(
          type: "job",
          location: [-23.443458330786086, -46.52455385945282],
          id: 7,
          service: 300,
          waitingTime: 0,
          job: 7,
          load: [0],
          // arrival: Timestamp.fromMillisecondsSinceEpoch(1600426546),
          arrival: 1600427046,
          duration: 9646,
          violations: [],
        ),
        Steps(
          type: "job",
          location: [-23.4534574161746, -46.52816104883616],
          id: 3,
          service: 300,
          waitingTime: 0,
          job: 3,
          load: [0],
          // arrival: Timestamp.fromMillisecondsSinceEpoch(1600426546),
          arrival: 1600427546,
          duration: 9646,
          violations: [],
        ),
        Steps(
          type: "end",
          location: [-23.438620855027683, -46.53742358994361],
          service: 0,
          waitingTime: 0,
          load: [0],
          // arrival: Timestamp.fromMillisecondsSinceEpoch(1600428245),
          arrival: 1600428245,
          duration: 11045,
          violations: [],
        ),
      ],
      violations: [],
    )
  ],
);
