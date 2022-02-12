import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  var myMarkers=HashSet<Marker>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Map"),
      ),
      body:  Center(
          child: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: const LatLng(31.037933, 31.381523), zoom: 14),
            onMapCreated: (GoogleMapController googleMapController){
          setState(() {
            myMarkers.add( Marker(markerId: MarkerId("1"),
              position: const LatLng(31.037933, 31.381523),
              infoWindow: InfoWindow(
                title: 'Ali',
                snippet: "elmahdy hagras",
                onTap: (){}
              )

            ));
          });
            },
            markers: myMarkers,
      )),
    );
  }
}
