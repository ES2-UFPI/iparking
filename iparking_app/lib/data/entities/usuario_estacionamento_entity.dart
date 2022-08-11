class UsuarioEstacionamentoEntity {
  int? id;
  String? nome;
  String? email;
  String? endereco;
  int? latitude;
  int? longitude;
  double? precoPrimeiraHora;
  double? precoAdicionalHora;

  UsuarioEstacionamentoEntity(
      this.id,
      this.nome,
      this.email,
      this.endereco,
      this.latitude,
      this.longitude,
      this.precoPrimeiraHora,
      this.precoAdicionalHora);
}
