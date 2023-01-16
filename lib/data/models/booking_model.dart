class Booking {
  final int id;
  final int idHour;
  final int idCourt;
  final DateTime date;
  final int precipitation;
  final int grade;
  final String weather;

  const Booking(
      {required this.id,
      required this.date,
      required this.idCourt,
      required this.idHour,
      required this.weather,
      required this.grade,
      required this.precipitation});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toString(),
      'idCourt': idCourt,
      'idHour': idHour,
      'weather': weather,
      'grade': grade,
      'precipitation': precipitation,
    };
  }

  @override
  String toString() {
    return 'hours{id: $id, date: $date, idCourt: $idCourt, idHour: $idHour, weather: $weather, grade: $grade, details: $precipitation}';
  }
}
