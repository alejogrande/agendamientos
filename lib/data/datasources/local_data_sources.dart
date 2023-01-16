import 'package:agendamientos/data/models/booking_model.dart';
import 'package:agendamientos/data/models/court_model.dart';

abstract class LocalDatabase {
  Future<List<Court>> viewCourts();
  Future<List<Booking>> viewBooking();
  Future<List<Booking>> viewAvailableDate(DateTime dateSelected, Court court);
  Future<dynamic> insertBooking(Booking booking);
  Future<dynamic> deleteBooking(Booking booking);
  Future<dynamic> updateBooking(Booking booking);
}
