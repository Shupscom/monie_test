import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:monie_test/components/bottom_widget.dart';
import 'package:monie_test/components/constants.dart';
import 'package:monie_test/details_screen.dart';

import 'components/custom_marker.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  late final String mapStyle;
  final Set<Marker> _markers = {};

  final LatLng _center = const LatLng(51.5, -0.09);
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(51.5, -0.09),
    zoom: 14.4746,
  );

  Future<void> _loadMarkers() async {
    final marker1 = await _createMarker(LatLng(51.5, -0.09), 'L1');
    final marker2 = await _createMarker(LatLng(51.5, -0.1), 'L2');
    final marker3 = await _createMarker(LatLng(51.51, -0.08), 'L3');
    final marker4 = await _createMarker(LatLng(51.5, -0.06), 'L4');

    setState(() {
      _markers.add(marker1);
      _markers.add(marker2);
      _markers.add(marker3);
      _markers.add(marker4);
    });
  }

  Future<Marker> _createMarker(LatLng position, String description) async {
    final bitmapDescriptor = await createCustomMarkerBitmap(description);

    return Marker(
      markerId: MarkerId(description),
      position: position,
      icon: bitmapDescriptor,
      infoWindow: InfoWindow(
        title: description,
      ),
    );
  }

  // final Set<Marker> _markers = {
  //   Marker(
  //     markerId: MarkerId('marker1'),
  //     position: LatLng(51.5, -0.09),
  //     infoWindow: InfoWindow(
  //       title: 'Marker 1',
  //       snippet: 'An interesting location',
  //     ),
  //     icon: ,
  //   ),
  //   Marker(
  //     markerId: MarkerId('marker2'),
  //     position: LatLng(51.5, -0.1),
  //     infoWindow: InfoWindow(
  //       title: 'Marker 2',
  //       snippet: 'Another interesting location',
  //     ),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  //   ),
  //   Marker(
  //     markerId: MarkerId('marker3'),
  //     position: LatLng(51.5, -0.08),
  //     infoWindow: InfoWindow(
  //       title: 'Marker 3',
  //       snippet: 'Another interesting location',
  //     ),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  //   ),
  // };

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/json_asset/map_style.json').then((string) {
      mapStyle = string;
    });
    _loadMarkers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              controller.setMapStyle(mapStyle);
              _controller.future.then((value) {
                value.setMapStyle(mapStyle);
              });
            },
            markers: _markers,
          ),
          Positioned(
            left: 16,
            right: 16,
            top: 40,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Saint Petersburg',
                      hintStyle: TextStyle(color: kPrimaryColour),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      filled: true,
                      fillColor: kWhiteColour,
                    )),
              ),
              SizedBox(width: 10,),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kWhiteColour
                ),
                child: IconButton(
                  icon: Icon(Icons.settings, color: kPrimaryColour,),
                  onPressed: () {
                  },
                ),
              ),

            ],
          ),),
          Positioned(
            left: 20,
            top: 350,
            child: Container(
              padding: EdgeInsets.all(16),
              width: 170,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: kWhiteColour,
              ),
              child: Column(
                children: [
                  EachRow(iconData: Icons.description, description: "Cosy areas",),
                  SizedBox(height: 5,),
                  EachRow(iconData: Icons.public_sharp, description: "Price",),
                  SizedBox(height: 5,),
                  EachRow(iconData: Icons.recycling_outlined, description: "Infrastructure",),
                  SizedBox(height: 5,),
                  EachRow(iconData: Icons.storage, description: "Without any layer",),
                ],
              ),
            ),
          ),
          Positioned(
              top: 517,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    height: 50,
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey
                        ),
                        child: Center(child: Icon(Icons.add, size: 30, color: kWhiteColour,)))
                    ,),
                  SizedBox(width: 70,),
                  Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.waves_outlined, size: 30, color: kWhiteColour,),
                        SizedBox(width: 5,),
                        Text('List of variants', style: TextStyle(color: kWhiteColour, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ],
              )
          ),

          Align(
           alignment: Alignment.bottomCenter,
            child: Container(margin: EdgeInsets.only(bottom: 10),
            child: CustomNavigationBar(active: "search",)),
          )
        ],
      ),
    );
  }
}
