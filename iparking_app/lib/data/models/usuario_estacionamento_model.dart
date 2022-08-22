import '../entities/entities.dart';

class UsuarioEstacionamentoModel {
  final String id;
  final String nome;
  final String email;
  final String endereco;
  final double latitude;
  final double longitude;
  final double precoPrimeiraHora;
  final double precoAdicionalHora;

  UsuarioEstacionamentoModel(
      {required this.id,
      required this.nome,
      required this.email,
      required this.endereco,
      required this.latitude,
      required this.longitude,
      required this.precoPrimeiraHora,
      required this.precoAdicionalHora});

  factory UsuarioEstacionamentoModel.fromJson(Map<String, dynamic> json) {
    return UsuarioEstacionamentoModel(
        id: json['id'],
        nome: json['nome'],
        email: json['email'],
        endereco: json['endereco'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        precoPrimeiraHora: json['precoPrimeiraHora'],
        precoAdicionalHora: json['precoAdicionalHora']);
  }

  UsuarioEstacionamentoEntity toEntity() => UsuarioEstacionamentoEntity(
      id: id,
      nome: nome,
      email: email,
      endereco: endereco,
      latitude: latitude,
      longitude: longitude,
      precoPrimeiraHora: precoPrimeiraHora,
      precoAdicionalHora: precoAdicionalHora);
}
