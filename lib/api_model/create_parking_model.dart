class CreateParkingModel {
  String msg;
  Parking parking;
  bool status;

  CreateParkingModel({
    required this.msg,
    required this.parking,
    required this.status,
  });

  factory CreateParkingModel.fromJson(Map<String, dynamic> json) {
    return CreateParkingModel(
      msg: json['msg'],
      parking: Parking.fromJson(json['Parking']),
      status: json['status'],
    );
  }
}

class Parking {
  String userId;
  String name;
  List<dynamic> images;
  String desc;
  List<dynamic> availableSections;
  List<TakenSection> takenSections;
  List<Nearest> nearest;
  bool haveSections;
  Location location;
  dynamic fullCapacity;
  dynamic availableCapacity;
  LocationCoordinates loc;
  Ratings ratings;
  String id;
  String createdAt;
  String updatedAt;
  dynamic v;

  Parking({
    required this.userId,
    required this.name,
    required this.images,
    required this.desc,
    required this.availableSections,
    required this.takenSections,
    required this.nearest,
    required this.haveSections,
    required this.location,
    required this.fullCapacity,
    required this.availableCapacity,
    required this.loc,
    required this.ratings,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Parking.fromJson(Map<String, dynamic> json) {
    return Parking(
      userId: json['userId'],
      name: json['name'],
      images: json['images'],
      desc: json['desc'],
      availableSections: json['availableSections'],
      takenSections: List<TakenSection>.from(json['takenSections'].map((x) => TakenSection.fromJson(x))),
      nearest: List<Nearest>.from(json['nearest'].map((x) => Nearest.fromJson(x))),
      haveSections: json['haveSections'],
      location: Location.fromJson(json['location']),
      fullCapacity: json['fullCapacity'],
      availableCapacity: json['availableCapacity'],
      loc: LocationCoordinates.fromJson(json['loc']),
      ratings: Ratings.fromJson(json['ratings']),
      id: json['_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}

class TakenSection {
  String sectionChar;
  dynamic capacity;

  TakenSection({
    required this.sectionChar,
    required this.capacity,
  });

  factory TakenSection.fromJson(Map<String, dynamic> json) {
    return TakenSection(
      sectionChar: json['sectionChar'],
      capacity: json['capacity'],
    );
  }
}

class Nearest {
  List<String> place;
  dynamic distanceToCenter;
  dynamic gate;

  Nearest({
    required this.place,
    required this.distanceToCenter,
    required this.gate,
  });

  factory Nearest.fromJson(Map<String, dynamic> json) {
    return Nearest(
      place: List<String>.from(json['place']),
      distanceToCenter: json['distanceToCenter'],
      gate: json['gate'],
    );
  }
}

class Location {
  dynamic lon;
  dynamic lat;
  String id;
  String createdAt;
  String updatedAt;

  Location({
    required this.lon,
    required this.lat,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lon: json['lon'],
      lat: json['lat'],
      id: json['_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class LocationCoordinates {
  String type;
  List<dynamic> coordinates;

  LocationCoordinates({
    required this.type,
    required this.coordinates,
  });

  factory LocationCoordinates.fromJson(Map<String, dynamic> json) {
    return LocationCoordinates(
      type: json['type'],
      coordinates: List<dynamic>.from(json['coordinates'].map((x) => dynamic)),
    );
  }
}

class Ratings {
  dynamic avgRating;
  dynamic count;
  List<dynamic> rateByUser;

  Ratings({
    required this.avgRating,
    required this.count,
    required this.rateByUser,
  });

  factory Ratings.fromJson(Map<String, dynamic> json) {
    return Ratings(
      avgRating: json['avgRating'],
      count: json['count'],
      rateByUser: json['rateByUser'],
    );
  }
}
