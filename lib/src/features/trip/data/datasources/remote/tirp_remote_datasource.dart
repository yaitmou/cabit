import 'package:cabit/src/core/types/result.dart';
import 'package:cabit/src/features/trip/data/models/trip_model.dart';

/// Remote data source interface for API calls
abstract class TripRemoteDataSource {
  /// Creates a new trip on the remote server
  Future<Result<TripModel>> createTrip(TripModel trip);
}
