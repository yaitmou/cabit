import 'package:cabit/src/core/entities/location.dart';
import 'package:cabit/src/features/trip/domain/entities/trip.dart';
import 'package:latlong2/latlong.dart';

/// Remote data source interface for API calls
abstract class TripRemoteDataSource {
  /// Creates a new trip on the remote server
  Future<Trip> createTrip(Trip trip);
  // use osm (open street map)
  // debouncer
  // Future<Result<List<String>>> getSuggestions();

  // Get the all the trips that we have so far
  Future<List<Trip>> getAllTrips();

  Future<List<Location>> getSuggestions(String query);

  Future<List<LatLng>> getRoutePath(Location from, Location to);
}
