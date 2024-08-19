import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapViewScreen extends StatefulWidget {
  final double lat;
  final double lng;
  const MapViewScreen({
    super.key,
    required this.lat,
    required this.lng,
  });

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  CameraPosition? _kGooglePlex;
  Future<void> _checkPermissions() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      await Permission.location.request();
    }
  }

  Future<void> _goToCurrentLocation() async {
    // Check permissions
    await _checkPermissions();

    // Get current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');

    var myCurrentLocation = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 19.0,
    );

    final GoogleMapController controller = await _controller.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(myCurrentLocation));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _kGooglePlex = CameraPosition(
      target: LatLng(widget.lat, widget.lng),
      zoom: 19.0,
    );

    _goToCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map View"),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex ??
            const CameraPosition(
              target: LatLng(25.170745, 55.292187),
              zoom: 19.0,
            ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _goToCurrentLocation();
        },
        label: const Text('Current Location'),
        icon: const Icon(Icons.location_on_outlined),
      ),
    );
  }
}
