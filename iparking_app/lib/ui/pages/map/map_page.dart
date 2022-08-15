import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_controller.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapController());
    return Scaffold(
        appBar: AppBar(title: const Text("Map Page"), actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.location_on_sharp))
        ]),
        body: GetBuilder<MapController>(
            init: controller,
            builder: (event) {
              return GoogleMap(
                mapType: MapType.normal,
                zoomControlsEnabled: true,
                initialCameraPosition:
                    CameraPosition(target: controller.position, zoom: 13),
                onMapCreated: controller.onMapCreated,
                myLocationEnabled: true,
              );
            }));
  }
}
