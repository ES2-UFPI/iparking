String formatPrice(String value) {
  double? format1 = double.tryParse(value);

  String format2 = "";
  if (format1 != null) {
    format2 = format1.toStringAsPrecision(3);
    return "R\$ $format2";
  } else {
    return "Em progresso...";
  }
}
