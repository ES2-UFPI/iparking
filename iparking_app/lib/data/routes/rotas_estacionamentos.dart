import '../entities/entities.dart';
import '../mock/mock.dart';
import '../models/models.dart';

class RotasEstacionamento {
  Future<List<EstacionamentoEntity>> listarEstacionamentos(
      String latitude, String longitude) async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));
      final response = mockListarEstacionamento();
      return response
          .map<EstacionamentoEntity>(
              (e) => EstacionamentoModel.fromJson(e).toEntity())
          .toList();
    } catch (error) {
      rethrow;
    }
  }
}