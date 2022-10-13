class EstacionamentoEntity {
  final String id;
  final String managerId;
  final String nome;
  final String image;
  final String fone;
  final String latitude;
  final int parkingSpaces;
  final String longitude;
  final double precoPrimeiraHora;
  final double precoAdicionalHora;

  EstacionamentoEntity(
      {required this.id,
      required this.nome,
      required this.managerId,
      required this.image,
      required this.fone,
      required this.latitude,
      required this.longitude,
      required this.precoPrimeiraHora,
      required this.parkingSpaces,
      required this.precoAdicionalHora});
}
