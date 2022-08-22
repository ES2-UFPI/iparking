import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../components/components.dart';
import 'map_controller.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapController());
    return Scaffold(
      body: Builder(builder: (context) {
        controller.estacionamentoAtual.stream.listen((event) {
          if (event != null) {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                context: context,
                builder: (_) {
                  return EstacionamentoDetalhesBottomSheet(
                      estacionamento: event);
                });
          }
        });
        return GetBuilder<MapController>(
          init: controller,
          builder: (event) {
            return Stack(
              children: [
                SafeArea(
                  child: GoogleMap(
                    mapType: MapType.normal,
                    zoomControlsEnabled: true,
                    initialCameraPosition:
                        CameraPosition(target: controller.position, zoom: 13),
                    onMapCreated: controller.onMapCreated,
                    myLocationEnabled: true,
                    markers: controller.markers,
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
