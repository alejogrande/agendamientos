import 'package:agendamientos/data/datasources/local_data_sources.dart';
import 'package:agendamientos/data/datasources/local_data_sources_implements.dart';
import 'package:agendamientos/data/models/court_model.dart';
import 'package:agendamientos/domain/repository/booking_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'court_selection_event.dart';
part 'court_selection_state.dart';

class CourtSelectionBloc
    extends Bloc<CourtSelectionEvent, CourtSelectionState> {
  CourtSelectionBloc() : super(CourtSelectionInitialState()) {
    on<CourtSelectionEvent>((event, emit) async {
      if (event is CourtSelectionLoadingEvent) {
        emit(CourtSelectionLoadingState());

        BookingRepository repository =
            BookingRepository(LocalDataSourceImplement());

        List<Court> listCourts = await repository.getCourts();

        emit(CourtSelectionSucefullState(listCourts));
      } else if (event is CourtSelectionSelectedEvent) {
        BookingRepository repository =
            BookingRepository(LocalDataSourceImplement());

        List<Court> listCourts = await repository.getCourts();

        emit(CourtSelectionSelectedState(listCourts, event.courtSelected));
      }
    });
  }
}
