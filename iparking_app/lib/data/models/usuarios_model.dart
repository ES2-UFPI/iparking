import '../entities/entities.dart';

class UsuariosModel {
  int? id;
  String? nome;
  String? email;
  UsuariosModel({required this.id, required this.nome, required this.email});

  factory UsuariosModel.fromJson(Map<String, dynamic> json) {
    return UsuariosModel(
        id: json['id'], nome: json['nome'], email: json['email']);
  }

  UsuarioEntity toEntity() => UsuarioEntity(id: id, nome: nome, email: email);
}
