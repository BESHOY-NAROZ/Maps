import 'package:c_to_s_maps/maps/google_map.dart';
import 'package:c_to_s_maps/maps/google_map_body.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  getLocationData() {
    GMapBody gMapBody = GMapBody();
    gMapBody.gMapLocation().then((value) {
      LatLng latLng = value;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return GMap(
          latLng: latLng,
        );
      }));
    });
  }

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(child: CircularProgressIndicator()),
      ),

    );
  }
}
