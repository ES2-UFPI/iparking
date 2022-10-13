String formatPrice(String value) {
  double format1 = double.parse(value);

  String format2 = format1.toStringAsPrecision(3);

  return "R\$ $format2";
}
