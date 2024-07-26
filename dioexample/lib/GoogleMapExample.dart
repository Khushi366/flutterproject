import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//AIzaSyAuVErvQJ1eCSHa3_59Kw8_sRFqpCtGqfU
class GoogleMapExample extends StatefulWidget {
  const GoogleMapExample({super.key});

  @override
  State<GoogleMapExample> createState() => _GoogleMapExampleState();
}

class _GoogleMapExampleState extends State<GoogleMapExample> {
  BitmapDescriptor? markerIcon1;
  late GoogleMapController mapController;


  @override
  void initState() {
    super.initState();
    // Load custom marker icons
    _loadMarkerIcons();

  }

  void _loadMarkerIcons() async {
    log("Loading marker icon...");

    markerIcon1 = await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(1, 1)),
      'assets/img/dimond.png',
    );
    if (markerIcon1 == null) {
      log("Failed to load marker icon");
    } else {
      log("Marker icon loaded successfully");
    }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(21.1702,72.8311),
          zoom: 14.4746,
        ),
        markers: {
           Marker(
            markerId: const MarkerId("marker1"),
            position: LatLng(21.1702,72.8311),
            icon: markerIcon1 ?? BitmapDescriptor.defaultMarker,
            // draggable: true,
          ),
          Marker(
            markerId: const MarkerId("marker2"),
            position: const LatLng(21.203510,72.839230),
          ),
          Marker(
            markerId: const MarkerId("marker3"),
            position: const LatLng(21.1431,72.8431),
          ),  // Marker
          Marker(
            markerId: const MarkerId("marker4"),
            position: const LatLng(21.1664,72.8410),
          ),

        },
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }
}
