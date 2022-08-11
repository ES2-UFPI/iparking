class SolicitacoesEntity {
  int? id;
  int? usuarioConvencional;
  int? idVaga;
  DateTime? tempoInicio;
  DateTime? tempoFim;

  SolicitacoesEntity(
      {required this.id,
      required this.usuarioConvencional,
      required this.idVaga,
      required this.tempoInicio,
      required this.tempoFim});
}
