import 'package:agendamientos/data/datasources/local_data_sources.dart';
import 'package:agendamientos/data/models/court_model.dart';
import 'package:agendamientos/data/models/booking_model.dart';
import 'package:agendamientos/domain/repository/booking_repository.dart';

class BookingRepositoryImplements implements BookingRepository {
  final LocalDatabase database;

  const BookingRepositoryImplements(this.database);

  @override
  Future deleteBooking(Booking booking) async {
    final response = await database.deleteBooking(booking);
    return response;
  }

  @override
  Future<List<Booking>> getAvailableDate(
      DateTime dateSelected, Court court) async {
    final response = await database.viewAvailableDate(dateSelected, court);
    return response;
  }

  @override
  Future<List<Booking>> getBooking() async {
    final response = await database.viewBooking();
    return response;
  }

  @override
  Future<List<Court>> getCourts() async {
    final response = await database.viewCourts();
    return response;
  }

  @override
  Future setBooking(Booking booking) async {
    final response = await database.insertBooking(booking);
    return response;
  }

  @override
  Future updateBooking(Booking booking) async {
    final response = await database.updateBooking(booking);
    return response;
  }
}
