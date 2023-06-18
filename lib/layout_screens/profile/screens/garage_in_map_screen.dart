import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:garduation/constants/components.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

import 'add_garage_screen.dart';

class GarageInMapScreen extends StatefulWidget {
  final String searchedPlace;
  final String garagePlace;

  const GarageInMapScreen({
    Key? key,
    required this.searchedPlace,
    required this.garagePlace,
  }) : super(key: key);

  @override
  GarageInMapScreenState createState() =>
      GarageInMapScreenState(searchedPlace, garagePlace);
}

class GarageInMapScreenState extends State<GarageInMapScreen> {
  final MapController _mapController = MapController();
  late LatLng _centerLatLng;
  final String searchedPlace;
  final String garagePlace;

  GarageInMapScreenState(this.searchedPlace, this.garagePlace);

  @override
  void initState() {
    super.initState();
    _centerLatLng = LatLng(0, 0);
    _updateMapCenter();
  }

  Future<void> _updateMapCenter() async {
    try {
      List<Location> locations = await locationFromAddress(garagePlace);
      if (locations.isNotEmpty) {
        final Location garageLocation = locations.first;
        _centerLatLng =
            LatLng(garageLocation.latitude, garageLocation.longitude);
        _mapController.move(_centerLatLng, 13.0);
      } else {
        // Handle case when no locations are found for the garage place
        debugPrint('No locations found for the garage place');
        // Use searched place as fallback
        List<Location> searchedLocations =
            await locationFromAddress(searchedPlace);
        if (searchedLocations.isNotEmpty) {
          final Location searchedLocation = searchedLocations.first;
          _centerLatLng =
              LatLng(searchedLocation.latitude, searchedLocation.longitude);
          _mapController.move(_centerLatLng, 13.0);
        } else {
          // Handle case when no locations are found for the searched place
          debugPrint('No locations found for the searched place');
          // Set default center location
          _centerLatLng = LatLng(0, 0);
          _mapController.move(_centerLatLng, 13.0);
        }
      }
    } catch (e) {
      // Handle any errors that occur during geocoding
      debugPrint('Error geocoding the place: $e');
    }
  }
  void _updateMarkerLocation(LatLng newLocation) {
    setState(() {
      _centerLatLng = newLocation;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddGarageScreen(
          lat: newLocation.latitude,
          long: newLocation.longitude,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: _centerLatLng,
              zoom: 13.0,
              minZoom: 5.0,
              maxZoom: 18.0,
              onTap: (point) {
                _updateMarkerLocation(point);
              },
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 30.0,
                    height: 30.0,
                    point: _centerLatLng,
                    builder: (ctx) =>
                        const Icon(Icons.location_on, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: screenHeight(context, .04),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(padding(context)),
                color: Colors.black54,
              ),
              padding: const EdgeInsets.all(8.0),
              width: screenWidth(context, .8),
              child: const Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 20.0,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      'Put a marker on the nearest place for your garage and click on it to confirm',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
