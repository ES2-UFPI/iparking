class UsuarioEstacionamentoEntity {
  final String id;
  final String nome;
  final String email;
  final String endereco;
  final double latitude;
  final double longitude;
  final double precoPrimeiraHora;
  final double precoAdicionalHora;

  UsuarioEstacionamentoEntity(
      {required this.id,
      required this.nome,
      required this.email,
      required this.endereco,
      required this.latitude,
      required this.longitude,
      required this.precoPrimeiraHora,
      required this.precoAdicionalHora});
}
