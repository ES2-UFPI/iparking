class usuarioConvencional {
  int? id;
  String? nome;
  String? email;

  usuarioConvencional(this.id, this.nome, this.email){}
}

class solicita{
  int? id;
  int? usuarioConvencional;
  int? id_vaga;
  DateTime? tempo_inicio;
  DateTime? tempo_fim;

  solicita(this.id, this.usuarioConvencional, this.id_vaga, this.tempo_inicio, this.tempo_fim);
}

class vagas{
  int? id;
  bool? livre;
  bool? ativo;

  vagas(this.id, this.livre, this.ativo);
}

class usuarioEstacionamento{
  int? id;
  String? nome;
  String? email;
  String? endereco;
  int? latitude;
  int? longitude;
  double? preco_primeira_hora;
  double? preco_adicional_hora;

  usuarioEstacionamento(this.id, this.nome, this.email, this.endereco, this.latitude, this.longitude, this.preco_primeira_hora, this.preco_adicional_hora);
}