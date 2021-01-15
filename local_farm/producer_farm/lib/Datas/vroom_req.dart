class VROOMReq {
  List<Vehicles> vehicles;
  List<Jobs> jobs;

  VROOMReq({this.vehicles, this.jobs});

  VROOMReq.fromJson(Map<String, dynamic> json) {
    if (json['vehicles'] != null) {
      vehicles = new List<Vehicles>();
      json['vehicles'].forEach((v) {
        vehicles.add(new Vehicles.fromJson(v));
      });
    }
    if (json['jobs'] != null) {
      jobs = new List<Jobs>();
      json['jobs'].forEach((v) {
        jobs.add(new Jobs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vehicles != null) {
      data['vehicles'] = this.vehicles.map((v) => v.toJson()).toList();
    }
    if (this.jobs != null) {
      data['jobs'] = this.jobs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vehicles {
  int id;
  List<double> start;
  List<double> end;
  List<int> capacity;
  List<int> timeWindow;

  Vehicles({this.id, this.start, this.end, this.capacity, this.timeWindow});

  Vehicles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    start = json['start'].cast<double>();
    end = json['end'].cast<double>();
    capacity = json['capacity'].cast<int>();
    timeWindow = json['time_window'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start'] = this.start;
    data['end'] = this.end;
    data['capacity'] = this.capacity;
    data['time_window'] = this.timeWindow;
    return data;
  }
}

class Jobs {
  int id;
  int service;
  List<double> location;

  Jobs({this.id, this.service, this.location});

  Jobs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    service = json['service'];
    location = json['location'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['service'] = this.service;
    data['location'] = this.location;
    return data;
  }
}
