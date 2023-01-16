import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'court_selection_event.dart';
part 'court_selection_state.dart';

class CourtSelectionBloc
    extends Bloc<CourtSelectionEvent, CourtSelectionState> {
  CourtSelectionBloc() : super(CourtSelectionInitialState()) {
    on<CourtSelectionEvent>((event, emit) {
      if (event is CourtSelectionInitialState) {
        emit(CourtSelectionLoadingState());
        
      }

    });
  }
}
