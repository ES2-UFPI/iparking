import '../../infra/infra.dart';
import '../entities/entities.dart';
import '../models/models.dart';
import 'base_url.dart';

class RotasUsuario {
  var http = HttpAdapter();
  String base_url = BASE_URL;

  Future<UsuarioEntity> cadastrarUsuarios(UsuarioParams params) async {
    final body = params.toJson();
    try {
      final response = await http.request(
          url: base_url + 'usuario', method: 'post', body: body);

      return UsuariosModel.fromJson(response).toEntity();
    } catch (error) {
      rethrow;
    }
  }

  Future<UsuarioEntity> pegarUsuarioEspecifico(String id) async {
    try {
      final response =
          await http.request(url: base_url + 'parking/${id}', method: 'get');

      return UsuariosModel.fromJson(response).toEntity();
    } catch (error) {
      rethrow;
    }
  }
}

class UsuarioParams {
  final String userId;
  final String parkingId;
  final String timeCheckin;

  UsuarioParams(
      {required this.userId,
      required this.parkingId,
      required this.timeCheckin});

  Map<String, dynamic> toJson() =>
      {"user_id": userId, "parking_id": parkingId, "time_checkin": timeCheckin};
}
