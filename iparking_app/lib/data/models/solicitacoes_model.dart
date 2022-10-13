import '../entities/entities.dart';

class SolicitacoesModel {
  String id;
  String? usuario;
  String estacionamento;
  String tempoInicio;
  String? tempoFim;
  String? price;

  SolicitacoesModel(
      {required this.id,
      required this.usuario,
      required this.estacionamento,
      required this.tempoInicio,
      required this.tempoFim,
      required this.price});

  factory SolicitacoesModel.fromJson(Map<String, dynamic> json) {
    return SolicitacoesModel(
        id: json['id'],
        usuario: json['user_id'],
        estacionamento: json['parking_id'],
        tempoInicio: json['time_checkin'],
        tempoFim: json['time_checkout'],
        price: json['price'].toString());
  }

  SolicitacoesEntity toEntity() => SolicitacoesEntity(
      id: id,
      usuario: usuario,
      estacionamento: estacionamento,
      tempoInicio: tempoInicio,
      tempoFim: tempoFim,
      price: price);
}
