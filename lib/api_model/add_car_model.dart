class AddCarModel {
  final String carId;
  final String id;
  final int enterGate;
  final LocationModel location;

  AddCarModel({
    required this.carId,
    required this.id,
    required this.enterGate,
    required this.location,
  });

  factory AddCarModel.fromJson(Map<String, dynamic> json) {
    return AddCarModel(
      carId: json['carId'],
      id: json['id'],
      enterGate: json['enterGate'],
      location: LocationModel.fromJson(json['location']),
    );
  }
}

class LocationModel {
  final double latitude;
  final double longitude;

  LocationModel({
    required this.latitude,
    required this.longitude,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      latitude: json['lat'],
      longitude: json['lon'],
    );
  }
}
