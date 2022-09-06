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
    try {
      final response = await http.request(
          url: base_url + 'parking', method: 'post', body: body);

      return SolicitacoesModel.fromJson(response).toEntity();
    } catch (error) {
      rethrow;
    }
  }

  Future<SolicitacoesEntity> SolicitacaoEspecifico(String id) async {
    try {
      final response =
          await http.request(url: base_url + 'parking/${id}', method: 'get');

      return SolicitacoesModel.fromJson(response).toEntity();
    } catch (error) {
      rethrow;
    }
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
  final String userId;
  final String parkingId;
  final String timeCheckin;

  SolicitacaoParams(
      {required this.userId,
      required this.parkingId,
      required this.timeCheckin});

  Map<String, dynamic> toJson() =>
      {"user_id": userId, "parking_id": parkingId, "time_checkin": timeCheckin};
}
