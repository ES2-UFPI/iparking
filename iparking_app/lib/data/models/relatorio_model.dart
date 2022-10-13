import 'package:iparking_app/data/entities/entities.dart';

class RelatorioModel {
  final int countCurrent;
  final int countCloset;
  final String totalPrice;

  RelatorioModel(
      {required this.countCloset,
      required this.countCurrent,
      required this.totalPrice});

  factory RelatorioModel.fromJson(Map<String, dynamic> json) {
    return RelatorioModel(
        countCloset: json['count_closet'],
        countCurrent: json['count_current'],
        totalPrice: json['total_price'].toString());
  }

  RelatorioEntity toEntity() => RelatorioEntity(
      countCloset: countCloset,
      countCurrent: countCurrent,
      totalPrice: totalPrice);
}
