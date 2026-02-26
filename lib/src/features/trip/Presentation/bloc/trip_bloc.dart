import 'package:cabit/src/core/entities/location.dart';
import 'package:cabit/src/features/trip/domain/usecases/get_location_suggestions.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'trip_events.dart';
part 'trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final GetLocationSuggestions _getLocationSuggestions;

  TripBloc({required GetLocationSuggestions getLocationSuggestions})
    : _getLocationSuggestions = getLocationSuggestions,
      super(TripInitial()) {
    on<SuggestionsCleared>((event, emit) => emit(TripInitial()));
    // Applying debounce to prevent API spamming

    on<LocationQueryChanged>(
      _onLocationQueryChanged,
      transformer: (events, mapper) {
        return events.debounceTime(const Duration(milliseconds: 500)).flatMap(mapper);
      },
    );
  }

  Future<void> _onLocationQueryChanged(LocationQueryChanged event, Emitter<TripState> emit) async {
    if (event.query.isEmpty) {
      emit(TripInitial());
      return;
    }

    emit(LocationSuggestionsLoading());

    final result = await _getLocationSuggestions(event.query);

    result.unwrap(
      (failure) => emit(LocationSuggestionsError(failure.message)),
      (suggestions) => emit(LocationSuggestionsLoaded(suggestions)),
    );
  }
}
