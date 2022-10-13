import '../entities/entities.dart';

class EstacionamentoModel {
  final String id;
  final String managerId;
  final String nome;
  final String image;
  final String fone;
  final String latitude;
  final int parkingSpaces;
  final String longitude;
  final double precoPrimeiraHora;
  final double precoAdicionalHora;

  EstacionamentoModel(
      {required this.id,
      required this.nome,
      required this.managerId,
      required this.image,
      required this.fone,
      required this.latitude,
      required this.longitude,
      required this.precoPrimeiraHora,
      required this.parkingSpaces,
      required this.precoAdicionalHora});

  factory EstacionamentoModel.fromJson(Map<String, dynamic> json) {
    return EstacionamentoModel(
        id: json['id'],
        nome: json['name'],
        managerId: json['manager_id'],
        image: json['image_url'],
        fone: json['phone'],
        parkingSpaces: json["parking_spaces"],
        latitude: json['latitude'],
        longitude: json['longitude'],
        precoPrimeiraHora: double.parse(json['first_price'].toString()),
        precoAdicionalHora: double.parse(json['price'].toString()));
  }

  EstacionamentoEntity toEntity() => EstacionamentoEntity(
      id: id,
      nome: nome,
      managerId: managerId,
      image: image,
      fone: fone,
      latitude: latitude,
      longitude: longitude,
      precoPrimeiraHora: precoPrimeiraHora,
      parkingSpaces: parkingSpaces,
      precoAdicionalHora: precoAdicionalHora);
}
