import '../entities/entities.dart';

class EstacionamentoModel {
  final String id;
  final String nome;
  final String image;
  final String email;
  final String fone;
  final double latitude;
  final double longitude;
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
      required this.precoPrimeiraHora,
      required this.precoAdicionalHora});

  factory EstacionamentoModel.fromJson(Map<String, dynamic> json) {
    return EstacionamentoModel(
        id: json['id'],
        nome: json['name'],
        image: json['image_url'],
        email: json['mail'],
        fone: json['fone'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        precoPrimeiraHora: json['first_price'],
        precoAdicionalHora: json['price']);
  }

  EstacionamentoEntity toEntity() => EstacionamentoEntity(
      id: id,
      nome: nome,
      image: image,
      email: email,
      latitude: latitude,
      longitude: longitude,
      precoPrimeiraHora: precoPrimeiraHora,
      precoAdicionalHora: precoAdicionalHora);
}
