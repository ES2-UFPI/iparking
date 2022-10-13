String dateFormate(String date) {
  DateTime format1 = DateTime.parse(date);

  return "${format1.day}/${format1.month}/${format1.year} ${format1.hour}:${format1.minute}:${format1.second}";
}
