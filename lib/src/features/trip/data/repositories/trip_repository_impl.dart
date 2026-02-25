import 'package:cabit/src/core/errors/failures.dart';
import 'package:cabit/src/core/types/result.dart';
import 'package:cabit/src/features/trip/data/datasources/remote/trip_remote_datasource.dart';
import 'package:cabit/src/features/trip/domain/entities/trip.dart';
import 'package:cabit/src/features/trip/domain/repositories/trip_repository.dart';

class TripRepositoryImpl implements TripRepository {
  final TripRemoteDataSource remoteDataSource;

  TripRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<Trip>> createTrip(Trip trip) async {
    // Here you can handle common logic like checking for internet connectivity
    // before calling the remote data source.
    try {
      final t = await remoteDataSource.createTrip(trip);
      return Result(value: t);
    } catch (e) {
      return Result(failure: ServerFailure(message: 'Something went wrong'));
    }
  }

  @override
  Future<Result<List<Trip>>> getAllTrips() async {
    try {
      final t = await remoteDataSource.getAllTrips();
      return Result(value: t);
    } catch (e) {
      return Result(failure: ServerFailure(message: 'Something went wrong'));
    }
  }
}
