import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/entities/entities.dart';
import '../../../data/routes/routes.dart';

class MapController extends GetxController {
  final latitude = 0.0.obs;
  final longitude = 0.0.obs;
  final estacionamentoAtual = Rx<EstacionamentoEntity?>(null);
  final estacionamentoSelecionado = Rx<EstacionamentoEntity?>(null);
  final solicitacaoAtual = Rx<SolicitacoesEntity?>(null);
  final isSearching = false.obs;
  late StreamSubscription<Position> positionStream;
  RotasEstacionamento rotasEstacionamento = RotasEstacionamento();
  RotasSolicitacoes rotasSolicitacoes = RotasSolicitacoes();

  LatLng position = const LatLng(-5.090379, -42.811079);
  late GoogleMapController _mapController;
  get getMapController => _mapController;
  final markers = <Marker>{};
  late List<EstacionamentoEntity> listaEstacionamentos;

  onMapCreated(GoogleMapController gmc) async {
    getPosition();
    _mapController = gmc;

    listaEstacionamentos = await rotasEstacionamento.listarEstacionamentos(
        latitude.toString(), longitude.toString());
    for (var element in listaEstacionamentos) {
      _addMarker(element);
    }
  }

  _addMarker(EstacionamentoEntity e) async {
    markers.add(
      Marker(
          markerId: MarkerId(e.id),
          position: LatLng(double.parse(e.latitude), double.parse(e.longitude)),
          infoWindow: InfoWindow(title: e.nome),
          icon: await BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(), "lib/ui/assets/imgs/barreira.png"),
          onTap: () {
            estacionamentoAtual.value = null;
            estacionamentoAtual.value = e;
          }),
    );
    update();
  }

  static MapController get to => Get.find<MapController>();

  watchPosition() async {
    positionStream = Geolocator.getPositionStream().listen((Position event) {
      longitude.value = event.longitude;
      latitude.value = event.longitude;
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

  void selecionaEstacionamentoAtual(EstacionamentoEntity estacionamentoEntity) {
    estacionamentoSelecionado.value = estacionamentoEntity;
    isSearching.value = true;
  }

  void descelecionarEstacionamentoAtual() {
    estacionamentoSelecionado.value = null;

    isSearching.value = false;
  }

  Future<void> cadastrarTicket() async {
    print(estacionamentoAtual.value!.id);
    solicitacaoAtual.value = await rotasSolicitacoes.cadastrarSolicitacao(
        SolicitacaoParams(parkingId: estacionamentoAtual.value!.id));
  }
}
