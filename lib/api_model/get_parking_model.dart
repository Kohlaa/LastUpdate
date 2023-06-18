class GetParkingModel {
  dynamic msg;
  List<Parking> parkings;
  bool status;

  GetParkingModel({
    required this.msg,
    required this.parkings,
    required this.status,
  });

  factory GetParkingModel.fromJson(Map<dynamic, dynamic> json) {
    return GetParkingModel(
      msg: json['msg'],
      parkings: List<Parking>.from(json['Parkings'].map((x) => Parking.fromJson(x))),
      status: json['status'],
    );
  }
}

class Parking {
  Ratings ratings;
  dynamic id;
  dynamic userId;
  dynamic name;
  List<dynamic> images;
  dynamic desc;
  List<dynamic> availableSections;
  List<TakenSection> takenSections;
  List<Nearest> nearest;
  bool haveSections;
  Location location;
  dynamic fullCapacity;
  dynamic availableCapacity;

  Parking({
    required this.ratings,
    required this.id,
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
  });

  factory Parking.fromJson(Map<dynamic, dynamic> json) {
    return Parking(
      ratings: Ratings.fromJson(json['ratings']),
      id: json['_id'],
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
    );
  }
}

class Ratings {
  dynamic avgRating;
  dynamic count;
  List<RateByUser> rateByUser;

  Ratings({
    required this.avgRating,
    required this.count,
    required this.rateByUser,
  });

  factory Ratings.fromJson(Map<dynamic, dynamic> json) {
    return Ratings(
      avgRating: json['avgRating'],
      count: json['count'],
      rateByUser: List<RateByUser>.from(json['rateByUser'].map((x) => RateByUser.fromJson(x))),
    );
  }
}

class RateByUser {
  dynamic userId;
  dynamic stars;
  dynamic id;

  RateByUser({
    required this.userId,
    required this.stars,
    required this.id,
  });

  factory RateByUser.fromJson(Map<dynamic, dynamic> json) {
    return RateByUser(
      userId: json['userId'],
      stars: json['stars'],
      id: json['_id'],
    );
  }
}

class TakenSection {
  dynamic sectionChar;
  dynamic capacity;

  TakenSection({
    required this.sectionChar,
    required this.capacity,
  });

  factory TakenSection.fromJson(Map<dynamic, dynamic> json) {
    return TakenSection(
      sectionChar: json['sectionChar'],
      capacity: json['capacity'],
    );
  }
}

class Nearest {
  List<dynamic> place;
  dynamic distanceToCenter;
  dynamic gate;

  Nearest({
    required this.place,
    required this.distanceToCenter,
    required this.gate,
  });

  factory Nearest.fromJson(Map<dynamic, dynamic> json) {
    return Nearest(
      place: List<dynamic>.from(json['place']),
      distanceToCenter: json['distanceToCenter'],
      gate: json['gate'],
    );
  }
}

class Location {
  double lon;
  double lat;
  dynamic id;
  dynamic createdAt;
  dynamic updatedAt;

  Location({
    required this.lon,
    required this.lat,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Location.fromJson(Map<dynamic, dynamic> json) {
    return Location(
      lon: json['lon'],
      lat: json['lat'],
      id: json['_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
