part of 'trip_bloc.dart';

abstract class TripEvent extends Equatable {
  const TripEvent();
  @override
  List<Object?> get props => [];
}

class LocationQueryChanged extends TripEvent {
  final String query;
  const LocationQueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}

class SuggestionsCleared extends TripEvent {}
