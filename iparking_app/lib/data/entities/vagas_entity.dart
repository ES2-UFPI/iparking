class VagasEntity {
  int? id;
  String? nome;
  bool? livre;
  bool? ativo;

  VagasEntity(
      {required this.id, required this.livre, required this.ativo, this.nome});
}
