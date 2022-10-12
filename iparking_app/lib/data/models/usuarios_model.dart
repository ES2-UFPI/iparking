import '../entities/entities.dart';
import 'models.dart';

class UsuariosModel {
  String? id;
  String? nome;
  String? email;
  List<EstacionamentoEntity?> estacionamentos;
  UsuariosModel(
      {required this.id,
      required this.nome,
      required this.email,
      required this.estacionamentos});

  factory UsuariosModel.fromJson(Map<String, dynamic> json) {
    return UsuariosModel(
        id: json['id'],
        nome: json['nome'],
        email: json['mail'],
        estacionamentos: json['parking']
            .toMap<EstacionamentoEntity>(
                (e) => EstacionamentoModel.fromJson(e).toEntity())
            .toList());
  }

  UsuarioEntity toEntity() => UsuarioEntity(
      id: id, nome: nome, email: email, estacionamentos: estacionamentos);
}
