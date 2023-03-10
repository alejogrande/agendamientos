


import 'package:agendamientos/data/datasources/local_data_sources.dart';
import 'package:agendamientos/data/models/booking_model.dart';
import 'package:agendamientos/data/models/court_model.dart';
import 'package:agendamientos/data/models/hour_model.dart';

class BookingRepository {
  final LocalDatabase database ;

  const BookingRepository(this.database);


  Future deleteBooking(Booking booking) async {
    final response = await database.deleteBooking(booking);
    return response;
  }


  Future<List<Booking>> getAvailableDate(
      DateTime dateSelected, Court court) async {
    final response = await database.viewAvailableDate(dateSelected, court);
    return response;
  }


  Future<List<Booking>> getBooking() async {
    final response = await database.viewBooking();
    return response;
  }


  Future<List<Court>> getCourts() async {
    final response = await database.viewCourts();
    return response;
  }


   Future<List<Hour>> getHours() async {
    final response = await database.viewHours();
    return response;
  }

  Future setBooking(Booking booking) async {
    final response = await database.insertBooking(booking);
    return response;
  }


  Future updateBooking(Booking booking) async {
    final response = await database.updateBooking(booking);
    return response;
  }
}
