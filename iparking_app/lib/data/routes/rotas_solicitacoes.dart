import '../../infra/infra.dart';
import '../entities/entities.dart';
import '../models/models.dart';
import 'base_url.dart';

class RotasSolicitacoes {
  var http = HttpAdapter();
  String base_url = BASE_URL;

  Future<List<SolicitacoesEntity>> listarSolicitacoes(
      String latitude, String longitude) async {
    try {
      final response =
          await http.request(url: base_url + 'parking', method: 'get');

      return response
          .map<SolicitacoesEntity>(
              (e) => SolicitacoesModel.fromJson(e).toEntity())
          .toList();
    } catch (error) {
      rethrow;
    }
  }

  Future<SolicitacoesEntity> cadastrarSolicitacao(
      SolicitacaoParams params) async {
    final body = params.toJson();

    final response = await http.request(
        url: base_url + 'ticket', method: 'post', body: body);

    return SolicitacoesModel.fromJson(response).toEntity();
  }

  Future<SolicitacoesEntity> SolicitacaoEspecifico(String id) async {
    final response =
        await http.request(url: base_url + 'parking/${id}', method: 'get');

    return SolicitacoesModel.fromJson(response).toEntity();
  }

  /* Future<SolicitacoesEntity> atualizarSolicitacao(
      EstacionamentoParams params, String id) async {
    final body = params.toJson();
    try {
      final response = await http.request(
          url: base_url + 'parking/${id}', method: 'put', body: body);

      return SolicitacoesModel.fromJson(response).toEntity();
    } catch (error) {
      rethrow;
    }
  } */
}

class SolicitacaoParams {
  final String parkingId;

  SolicitacaoParams({required this.parkingId});

  Map<String, dynamic> toJson() => {
        "user_id": "2d376085-81a2-42a3-80a4-ab06dcf8dbb5",
        "parking_id": parkingId,
      };
}
