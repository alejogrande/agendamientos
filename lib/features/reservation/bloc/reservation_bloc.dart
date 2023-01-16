import 'dart:ffi';

import 'package:agendamientos/data/datasources/local_data_sources_implements.dart';
import 'package:agendamientos/data/models/booking_model.dart';
import 'package:agendamientos/data/models/court_model.dart';
import 'package:agendamientos/data/models/hour_model.dart';
import 'package:agendamientos/data/models/weather_model.dart' as w;
import 'package:agendamientos/domain/repository/booking_repository.dart';
import 'package:agendamientos/domain/repository/http_repository.dart';
import 'package:agendamientos/shared_library/Utils.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:meta/meta.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationInitial()) {
    on<ReservationEvent>((event, emit) async {
      if (event is ReservationInitialEvent) {
        emit(ReservationInitialState(event.court));
      } else if (event is ReservationLoadingEvent) {
        emit(ReservationLoadingState());
      } else if (event is ReservationSelectedDateEvent) {
        BookingRepository repository =
            BookingRepository(LocalDataSourceImplement());

        List<Hour> listHours = await repository.getHours();
        w.Weather? response = await HttpService.getWeather(
            Utils.formatDateTimeService(event.date));
        String? icon =
            "https:${response?.forecast?.forecastday?[0]!.hour?[0]!.condition?.icon}";
        int? grade =
            response?.forecast?.forecastday?[0]!.hour?[0]!.tempC!.round();

        emit(ReservationSelectedDateState(
            event.court, event.date, listHours, icon, grade));
      } else if (event is CreateReservationEvent) {
        BookingRepository repository =
            BookingRepository(LocalDataSourceImplement());

        var response = await repository.setBooking(event.booking);
      }
    });
  }
}
