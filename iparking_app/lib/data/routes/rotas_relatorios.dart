import '../../infra/infra.dart';
import '../entities/entities.dart';
import '../models/models.dart';
import 'base_url.dart';

class RotasRelatorios {
  var http = HttpAdapter();
  String base_url = BASE_URL;

  Future<RelatorioEntity> relatorioSolicitacoes(String id) async {
    try {
      final response = await http.request(
          url: base_url + 'relatorios/ticket/$id', method: 'get');

      return RelatorioModel.fromJson(response).toEntity();
    } catch (error) {
      rethrow;
    }
  }
}
