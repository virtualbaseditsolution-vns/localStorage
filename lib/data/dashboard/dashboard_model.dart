class CameraModel {
  List<Photos>? photos;

  CameraModel({this.photos});

  CameraModel.fromJson(Map<String, dynamic> json) {
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(Photos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photos {
  int? id;
  int? sol;
  Camera? camera;
  String? imgSrc;
  String? earthDate;
  Rover? rover;

  Photos(
      {this.id,
        this.sol,
        this.camera,
        this.imgSrc,
        this.earthDate,
        this.rover});

  Photos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sol = json['sol'];
    camera =
    json['camera'] != null ? Camera.fromJson(json['camera']) : null;
    imgSrc = json['img_src'];
    earthDate = json['earth_date'];
    rover = json['rover'] != null ? Rover.fromJson(json['rover']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['sol'] = this.sol;
    if (this.camera != null) {
      data['camera'] = this.camera!.toJson();
    }
    data['img_src'] = this.imgSrc;
    data['earth_date'] = this.earthDate;
    if (this.rover != null) {
      data['rover'] = this.rover!.toJson();
    }
    return data;
  }
}

class Camera {
  int? id;
  String? name;
  int? roverId;
  String? fullName;

  Camera({this.id, this.name, this.roverId, this.fullName});

  Camera.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    roverId = json['rover_id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['rover_id'] = this.roverId;
    data['full_name'] = this.fullName;
    return data;
  }
}

class Rover {
  int? id;
  String? name;
  String? landingDate;
  String? launchDate;
  String? status;
  int? maxSol;
  String? maxDate;
  int? totalPhotos;
  List<Cameras>? cameras;

  Rover(
      {this.id,
        this.name,
        this.landingDate,
        this.launchDate,
        this.status,
        this.maxSol,
        this.maxDate,
        this.totalPhotos,
        this.cameras});

  Rover.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    landingDate = json['landing_date'];
    launchDate = json['launch_date'];
    status = json['status'];
    maxSol = json['max_sol'];
    maxDate = json['max_date'];
    totalPhotos = json['total_photos'];
    if (json['cameras'] != null) {
      cameras = <Cameras>[];
      json['cameras'].forEach((v) {
        cameras!.add(new Cameras.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['landing_date'] = this.landingDate;
    data['launch_date'] = this.launchDate;
    data['status'] = this.status;
    data['max_sol'] = this.maxSol;
    data['max_date'] = this.maxDate;
    data['total_photos'] = this.totalPhotos;
    if (this.cameras != null) {
      data['cameras'] = this.cameras!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cameras {
  String? name;
  String? fullName;

  Cameras({this.name, this.fullName});

  Cameras.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    return data;
  }
}