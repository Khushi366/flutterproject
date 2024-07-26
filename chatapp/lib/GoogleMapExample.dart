import 'dart:developer';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  late GoogleMapController mapController;

  Set<Marker>? markers = Set<Marker>();

  
  getdata() async
  {
    log("Get Data Called");
    await FirebaseFirestore.instance.collection("locations").get().then((documents){

      documents.docs.forEach((document) {
       setState(() {
         markers!.add(
             Marker(
               markerId: MarkerId(document.id.toString()),
               position: LatLng(double.parse(document["latti"].toString()),double.parse(document["longi"].toString())),
               // draggable: true,
             )
         );
       });
      });
    });
  }

  Timer? timer;


  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    timer = Timer.periodic(Duration(seconds: 10), (Timer t) => getdata());
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
        markers: markers!,
        // markers: {
        //   Marker(
        //     markerId: const MarkerId("marker1"),
        //     position: LatLng(21.1702,72.8311),
        //     // draggable: true,
        //   ),
        //   Marker(
        //     markerId: const MarkerId("marker2"),
        //     position: const LatLng(21.203510,72.839230),
        //   ),
        //   Marker(
        //     markerId: const MarkerId("marker3"),
        //     position: const LatLng(21.1431,72.8431),
        //   ),  // Marker
        //   Marker(
        //     markerId: const MarkerId("marker4"),
        //     position: const LatLng(21.1664,72.8410),
        //   ),
        //
        // },
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }
}
