part of 'court_selection_bloc.dart';

@immutable
abstract class CourtSelectionState {}

class CourtSelectionInitialState extends CourtSelectionState {}

class CourtSelectionLoadingState extends CourtSelectionState {}

class CourtSelectionErrorState extends CourtSelectionState {}

class CourtSelectionSelectedState extends CourtSelectionState {}
