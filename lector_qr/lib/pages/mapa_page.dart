import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:lector_qr/models/scan_model.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({super.key});

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  //
  final Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  //
  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition puntoInicial = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17.5,
      tilt: 50,
    );

    // ignore: prefer_collection_literals
    final Set<Marker> markers = Set<Marker>();
    markers.add(Marker(
      markerId: const MarkerId('geo-location'),
      position: scan.getLatLng(),
    ));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coordenadas'),
        actions: [
          IconButton(
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: scan.getLatLng(),
                    zoom: 17.5,
                    tilt: 50,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.location_on),
          ),
        ],
      ),
      body: GoogleMap(
        markers: markers,
        myLocationButtonEnabled: true,
        mapType: mapType,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            if (mapType == MapType.normal) {
              mapType = MapType.satellite;
            } else {
              mapType = MapType.normal;
            }
          });
        },
        child: const Icon(
          Icons.layers,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
