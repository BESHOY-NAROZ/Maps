import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMap extends StatefulWidget {
  LatLng latLng;

  GMap({this.latLng});

  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  HashSet<Marker> myMarker = HashSet<Marker>();
  Set<Polyline> dots = Set<Polyline>();

  createPolyLines() {
    dots.add(
      Polyline(
          polylineId: PolylineId('2'),
          color: Colors.black,
          width: 2,
          patterns: [PatternItem.dot],
          points: [widget.latLng, LatLng(27.557920, 30.815948)]),
    );
  }

  @override
  Widget build(BuildContext context) {
    createPolyLines();
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: widget.latLng, zoom: 17),
        onMapCreated: (onMapCreated) {
          setState(() {
            myMarker.add(
              Marker(
                markerId: MarkerId('1'),
                position: widget.latLng,
                infoWindow: InfoWindow(
                  title: 'Just Keep Going',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
            myMarker.add(
              Marker(
                markerId: MarkerId('3'),
                position: LatLng(27.557920, 30.815948),
                infoWindow: InfoWindow(
                  title: 'Just Keep Going',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          });
        },
        markers: myMarker,
        polylines: dots,
      ),
    );
  }
}
