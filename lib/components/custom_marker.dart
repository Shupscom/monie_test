import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class CustomMarker extends StatelessWidget {
  final String description;
  CustomMarker(this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 40,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(10.0),
              )
            ),
            child: Center(child: Text(description, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),)),
          );
  }
}


Future<BitmapDescriptor> createCustomMarkerBitmap(String description) async {
  final markerWidget = CustomMarker(description);
  return await markerWidget.toBitmapDescriptor();
}