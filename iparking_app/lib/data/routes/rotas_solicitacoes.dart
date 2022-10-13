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

  Future<SolicitacoesEntity> solicitacaoEspecifico(String id) async {
    final response =
        await http.request(url: base_url + 'ticket/${id}', method: 'get');

    return SolicitacoesModel.fromJson(response).toEntity();
  }

  Future<SolicitacoesEntity> fecharSolicitacao(String id) async {
    final response =
        await http.request(url: base_url + 'ticket/${id}', method: 'put');

    return SolicitacoesModel.fromJson(response['ticket']).toEntity();
  }
}

class SolicitacaoParams {
  final String parkingId;

  SolicitacaoParams({required this.parkingId});

  Map<String, dynamic> toJson() => {
        "user_id": "5b79158a-19b6-4266-adae-0341fc2b3923",
        "parking_id": parkingId,
      };
}
