import '../../infra/infra.dart';
import '../entities/entities.dart';
import '../models/models.dart';
import 'routes.dart';

class RotasEstacionamento {
  var http = HttpAdapter();
  String base_url = BASE_URL;

  Future<List<EstacionamentoEntity>> listarEstacionamentos(
      String latitude, String longitude) async {
    final response =
        await http.request(url: base_url + 'parking', method: 'get');

    /* final response = await Future.delayed(
        Duration(milliseconds: 200),
        () {
          return mockListarEstacionamento();
        },
      ); */

    return response
        .map<EstacionamentoEntity>(
            (e) => EstacionamentoModel.fromJson(e).toEntity())
        .toList();
  }

  Future<EstacionamentoEntity> cadastrarEstacionameto(
      EstacionamentoParams params) async {
    final body = params.toJson();
    try {
      final response = await http.request(
          url: base_url + 'parking', method: 'post', body: body);

      return EstacionamentoModel.fromJson(response).toEntity();
    } catch (error) {
      rethrow;
    }
  }

  Future<EstacionamentoEntity> estacionametoEspecifico(String id) async {
    try {
      final response =
          await http.request(url: base_url + 'parking/${id}', method: 'get');

      return EstacionamentoModel.fromJson(response).toEntity();
    } catch (error) {
      rethrow;
    }
  }

  Future<EstacionamentoEntity> atualizarEstacionameto(
      EstacionamentoParams params, String id) async {
    final body = params.toJson();
    try {
      final response = await http.request(
          url: base_url + 'parking/${id}', method: 'put', body: body);

      return EstacionamentoModel.fromJson(response).toEntity();
    } catch (error) {
      rethrow;
    }
  }
}

class EstacionamentoParams {
  final String nome;
  final String image;
  final String fone;
  final String email;
  final String latitude;
  final String longitude;
  final double precoPrimeiraHora;
  final double precoAdicionalHora;
  final int parkingSpaces;

  EstacionamentoParams(
      {required this.nome,
      required this.image,
      required this.fone,
      required this.email,
      required this.latitude,
      required this.longitude,
      required this.precoPrimeiraHora,
      required this.precoAdicionalHora,
      required this.parkingSpaces});

  Map<String, dynamic> toJson() => {
        "name": nome,
        "image_url": image,
        "mail": email,
        "phone": fone,
        "first_price": precoPrimeiraHora,
        "price": precoAdicionalHora,
        "latitude": latitude,
        "longitude": longitude,
        "parking_spaces": parkingSpaces
      };
}
