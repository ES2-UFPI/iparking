import 'package:iparking_app/data/entities/entities.dart';
import 'package:iparking_app/data/routes/routes.dart';
import 'package:test/test.dart';

void main() {
  RotasSolicitacoes _rotasSolicitacoes = RotasSolicitacoes();
  RotasUsuario _rotasUsuario = RotasUsuario();
  group("Validação dos dados vindos das rotas", () {
    test("Rota de Solicitação", () async {
      String idTeste = "07ba7de5-44e5-49c6-8894-4479f59ee79d";

      var resposta = await _rotasSolicitacoes.solicitacaoEspecifico(idTeste);

      expect(resposta.runtimeType, SolicitacoesEntity);
    });

    test("Rota de Rota de Usuario", () async {
      String idTeste = "5b79158a-19b6-4266-adae-0341fc2b3923";

      var resposta = await _rotasUsuario.pegarUsuarioEspecifico(idTeste);

      expect(resposta.runtimeType, UsuarioEntity);
    });

    test("Teste da rota de fechar solicitação", () async {
      String idTeste = "07ba7de5-44e5-49c6-8894-4479f59ee79d";

      var resposta = await _rotasSolicitacoes.fecharSolicitacao(idTeste);

      expect(resposta.runtimeType, SolicitacoesEntity);
    });
  });
}
