part of 'trip_bloc.dart';

sealed class TripState extends Equatable {
  const TripState();
  @override
  List<Object?> get props => [];
}

class TripInitial extends TripState {}

class LocationSuggestionsLoading extends TripState {}

class LocationSuggestionsLoaded extends TripState {
  final List<Location> suggestions;
  const LocationSuggestionsLoaded(this.suggestions);

  @override
  List<Object?> get props => [suggestions];
}

class LocationSuggestionsError extends TripState {
  final String message;
  const LocationSuggestionsError(this.message);

  @override
  List<Object?> get props => [message];
}
