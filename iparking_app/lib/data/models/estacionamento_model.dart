import '../entities/entities.dart';

class EstacionamentoModel {
  final String id;
  final String nome;
  final String image;
  final String email;
  final String fone;
  final String latitude;
  final String longitude;
  final int parkingSpaces;
  final double precoPrimeiraHora;
  final double precoAdicionalHora;

  EstacionamentoModel(
      {required this.id,
      required this.nome,
      required this.image,
      required this.email,
      required this.fone,
      required this.latitude,
      required this.longitude,
      required this.parkingSpaces,
      required this.precoPrimeiraHora,
      required this.precoAdicionalHora});

  factory EstacionamentoModel.fromJson(Map<String, dynamic> json) {
    return EstacionamentoModel(
        id: json['id'],
        nome: json['name'],
        image: json['image_url'],
        email: json['mail'],
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
      image: image,
      email: email,
      fone: fone,
      latitude: latitude,
      longitude: longitude,
      parkingSpaces: parkingSpaces,
      precoPrimeiraHora: precoPrimeiraHora,
      precoAdicionalHora: precoAdicionalHora);
}
