import '../entities/entities.dart';

class EstacionamentoModel {
  final String id;
  final String nome;
  final String image;
  final String email;
  final String endereco;
  final double latitude;
  final double longitude;
  final double precoPrimeiraHora;
  final double precoAdicionalHora;

  EstacionamentoModel(
      {required this.id,
      required this.nome,
      required this.image,
      required this.email,
      required this.endereco,
      required this.latitude,
      required this.longitude,
      required this.precoPrimeiraHora,
      required this.precoAdicionalHora});

  factory EstacionamentoModel.fromJson(Map<String, dynamic> json) {
    return EstacionamentoModel(
        id: json['id'],
        nome: json['nome'],
        image: json['image'],
        email: json['email'],
        endereco: json['endereco'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        precoPrimeiraHora: json['precoPrimeiraHora'],
        precoAdicionalHora: json['precoAdicionalHora']);
  }

  EstacionamentoEntity toEntity() => EstacionamentoEntity(
      id: id,
      nome: nome,
      image: image,
      email: email,
      endereco: endereco,
      latitude: latitude,
      longitude: longitude,
      precoPrimeiraHora: precoPrimeiraHora,
      precoAdicionalHora: precoAdicionalHora);
}
