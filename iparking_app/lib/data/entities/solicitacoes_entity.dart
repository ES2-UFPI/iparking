class SolicitacoesEntity {
  String id;
  String usuario;
  String estacionamento;
  DateTime tempoInicio;
  DateTime? tempoFim;
  String? price;

  SolicitacoesEntity(
      {required this.id,
      required this.usuario,
      required this.estacionamento,
      required this.tempoInicio,
      required this.tempoFim,
      required this.price});
}
