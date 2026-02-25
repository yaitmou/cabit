import 'package:cabit/src/core/types/result.dart';
import 'package:cabit/src/features/trip/domain/entities/trip.dart';

/// Remote data source interface for API calls
abstract class TripRemoteDataSource {
  /// Creates a new trip on the remote server
  Future<Result<Trip>> createTrip(Trip trip);
  // use osm (open street map)
  // Future<Result<List<String>>> getSuggestions();
}
