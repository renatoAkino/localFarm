import 'package:cloud_firestore/cloud_firestore.dart';

class Routing {
  int code;
  Summary summary;
  // List<Null> unassigned;
  List<Routes> routes;

  Routing({this.code, this.summary, this.routes});

  Routing.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
    // if (json['unassigned'] != null) {
    //   unassigned = new List<Null>();
    //   json['unassigned'].forEach((v) {
    //     unassigned.add(new Null.fromJson(v));
    //   });
    // }
    if (json['routes'] != null) {
      routes = new List<Routes>();
      json['routes'].forEach((v) {
        routes.add(new Routes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.summary != null) {
      data['summary'] = this.summary.toJson();
    }
    // if (this.unassigned != null) {
    //   data['unassigned'] = this.unassigned.map((v) => v.toJson()).toList();
    // }
    if (this.routes != null) {
      data['routes'] = this.routes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Summary {
  int cost;
  int unassigned;
  List<int> delivery;
  List<int> amount;
  List<int> pickup;
  int service;
  int duration;
  int waitingTime;
  int priority;
  List<Null> violations;
  ComputingTimes computingTimes;

  Summary({
    this.cost,
    this.unassigned,
    this.delivery,
    this.amount,
    this.pickup,
    this.service,
    this.duration,
    this.waitingTime,
    this.priority,
    this.violations,
    this.computingTimes,
  });

  Summary.fromJson(Map<String, dynamic> json) {
    cost = json['cost'];
    unassigned = json['unassigned'];
    delivery = json['delivery'].cast<int>();
    amount = json['amount'].cast<int>();
    pickup = json['pickup'].cast<int>();
    service = json['service'];
    duration = json['duration'];
    waitingTime = json['waiting_time'];
    priority = json['priority'];
    // if (json['violations'] != null) {
    //   violations = new List<Null>();
    //   json['violations'].forEach((v) {
    //     violations.add(new Null.fromJson(v));
    //   });
    // }
    computingTimes = json['computing_times'] != null
        ? new ComputingTimes.fromJson(json['computing_times'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cost'] = this.cost;
    data['unassigned'] = this.unassigned;
    data['delivery'] = this.delivery;
    data['amount'] = this.amount;
    data['pickup'] = this.pickup;
    data['service'] = this.service;
    data['duration'] = this.duration;
    data['waiting_time'] = this.waitingTime;
    data['priority'] = this.priority;
    // if (this.violations != null) {
    //   data['violations'] = this.violations.map((v) => v.toJson()).toList();
    // }
    if (this.computingTimes != null) {
      data['computing_times'] = this.computingTimes.toJson();
    }
    return data;
  }
}

class ComputingTimes {
  int loading;
  int solving;

  ComputingTimes({this.loading, this.solving});

  ComputingTimes.fromJson(Map<String, dynamic> json) {
    loading = json['loading'];
    solving = json['solving'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loading'] = this.loading;
    data['solving'] = this.solving;
    return data;
  }
}

class Routes {
  int vehicle;
  int cost;
  List<int> delivery;
  List<int> amount;
  List<int> pickup;
  int service;
  int duration;
  int waitingTime;
  int priority;
  List<Steps> steps;
  List<Null> violations;
  String geometry;

  Routes({
    this.vehicle,
    this.cost,
    this.delivery,
    this.amount,
    this.pickup,
    this.service,
    this.duration,
    this.waitingTime,
    this.priority,
    this.steps,
    this.violations,
    this.geometry,
  });

  Routes.fromJson(Map<String, dynamic> json) {
    vehicle = json['vehicle'];
    cost = json['cost'];
    delivery = json['delivery'].cast<int>();
    amount = json['amount'].cast<int>();
    pickup = json['pickup'].cast<int>();
    service = json['service'];
    duration = json['duration'];
    waitingTime = json['waiting_time'];
    priority = json['priority'];
    if (json['steps'] != null) {
      steps = new List<Steps>();
      json['steps'].forEach((v) {
        steps.add(new Steps.fromJson(v));
      });
      geometry = json['geometry'];
    }
    // if (json['violations'] != null) {
    //   violations = new List<Null>();
    //   json['violations'].forEach((v) {
    //     violations.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicle'] = this.vehicle;
    data['cost'] = this.cost;
    data['delivery'] = this.delivery;
    data['amount'] = this.amount;
    data['pickup'] = this.pickup;
    data['service'] = this.service;
    data['duration'] = this.duration;
    data['waiting_time'] = this.waitingTime;
    data['priority'] = this.priority;
    if (this.steps != null) {
      data['steps'] = this.steps.map((v) => v.toJson()).toList();
    }
    data['geometry'] = this.geometry;
    // if (this.violations != null) {
    //   data['violations'] = this.violations.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Steps {
  String type;
  List<double> location;
  int service;
  int waitingTime;
  List<int> load;
  int arrival;
  int duration;
  List<Null> violations;
  int id;
  int job;

  Steps(
      {this.type,
      this.location,
      this.service,
      this.waitingTime,
      this.load,
      this.arrival,
      this.duration,
      this.violations,
      this.id,
      this.job});

  Steps.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    location = json['location'].cast<double>();
    service = json['service'];
    waitingTime = json['waiting_time'];
    load = json['load'].cast<int>();
    arrival = json['arrival'];
    duration = json['duration'];
    // if (json['violations'] != null) {
    //   violations = new List<Null>();
    //   json['violations'].forEach((v) {
    //     violations.add(new Null.fromJson(v));
    //   });
    // }
    id = json['id'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['location'] = this.location;
    data['service'] = this.service;
    data['waiting_time'] = this.waitingTime;
    data['load'] = this.load;
    data['arrival'] = this.arrival;
    data['duration'] = this.duration;
    // if (this.violations != null) {
    //   data['violations'] = this.violations.map((v) => v.toJson()).toList();
    // }
    data['id'] = this.id;
    data['job'] = this.job;
    return data;
  }
}
