import 'package:cabit/src/core/types/result.dart';
import 'package:cabit/src/features/trip/domain/entities/trip.dart';

abstract class TripRepository {
  /// Calls the remote data source to create a trip
  Future<Result<Trip>> createTrip(Trip trip);
  Future<Result<List<Trip>>> getAllTrips();
}
