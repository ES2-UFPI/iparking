import 'entities.dart';

class UsuarioEntity {
  String? id;
  String? nome;
  String? email;
  List<EstacionamentoEntity?> estacionamentos;

  UsuarioEntity(
      {required this.id,
      required this.nome,
      required this.email,
      required this.estacionamentos});
}
