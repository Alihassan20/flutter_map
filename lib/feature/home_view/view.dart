import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();
    createPloyLine();
  }

  List<Polyline> myPolyline = [];

  createPloyLine() {
    myPolyline.add(
      Polyline(
          polylineId: const PolylineId('1'),
          color: Colors.blue,
          width: 3,
          points: [
            LatLng(31.037933, 31.381523),
            LatLng(31.037933, 31.388523),
          ],
          patterns: [
            PatternItem.dash(20),
            PatternItem.gap(10),
          ]),
    );
  }

  var myMarkers=HashSet<Marker>();

  Set<Circle> circles = Set.from([Circle(
    circleId: CircleId("1"),
    center: LatLng(31.037933, 31.381523),
    radius: 1000,
    strokeWidth: 1,
    strokeColor: Colors.lightBlue.withOpacity(0.5)
  )]);
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
            polylines: myPolyline.toSet(),

            circles:circles ,
            markers: myMarkers,
      )),
    );
  }
}
