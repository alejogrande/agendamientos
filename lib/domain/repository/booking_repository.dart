


import 'package:agendamientos/data/models/booking_model.dart';
import 'package:agendamientos/data/models/court_model.dart';

abstract class BookingRepository {
  Future<List<Court>>getCourts();
  Future<List<Booking>> getBooking();
  Future<List<Booking>> getAvailableDate(DateTime dateSelected,Court court);
  Future<dynamic> setBooking(Booking booking);
  Future<dynamic> deleteBooking(Booking booking);
  Future<dynamic> updateBooking(Booking booking);
}