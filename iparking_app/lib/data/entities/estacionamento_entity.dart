class EstacionamentoEntity {
  final String id;
  final String nome;
  final String image;
  final String email;
  final String fone;
  final String latitude;
  final String longitude;
  final double precoPrimeiraHora;
  final double precoAdicionalHora;

  EstacionamentoEntity(
      {required this.id,
      required this.nome,
      required this.image,
      required this.email,
      required this.fone,
      required this.latitude,
      required this.longitude,
      required this.precoPrimeiraHora,
      required this.precoAdicionalHora});
}
