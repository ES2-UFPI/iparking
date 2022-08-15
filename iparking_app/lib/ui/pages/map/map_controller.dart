import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  final latitude = 0.0.obs;
  final longitude = 0.0.obs;

  late StreamSubscription<Position> positionStream;

  LatLng _position = LatLng(-23.571505, -46.689104);
  late GoogleMapController _mapController;

  get getMapController => _mapController;
  get position => _position;

  onMapCreated(GoogleMapController gmc) async {
    _mapController = gmc;
  }

  static MapController get to => Get.find<MapController>();

  watchPosition() async {
    positionStream = Geolocator.getPositionStream().listen((Position event) {
      if (event != null) {
        longitude.value = event.longitude;
        latitude.value = event.longitude;
      }
    });
  }

  @override
  void onClose() {
    positionStream.cancel();
    super.onClose();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;
    bool ativado = await Geolocator.isLocationServiceEnabled();

    if (!ativado) {
      return Future.error(
          'Por favor, habilite a localização no seu smartphone.');
    }

    permissao = await Geolocator.checkPermission();

    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();

      if (permissao == LocationPermission.denied) {
        return Future.error(
            'Você precisa autorizar acesso à localização nas configurações.');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  getPosition() async {
    try {
      final posicao = await _posicaoAtual();
      latitude.value = posicao.latitude;
      longitude.value = posicao.longitude;
      _mapController.animateCamera(
          CameraUpdate.newLatLng(LatLng(latitude.value, longitude.value)));
    } catch (e) {
      Get.snackbar("Erro", e.toString());
    }
  }
}
