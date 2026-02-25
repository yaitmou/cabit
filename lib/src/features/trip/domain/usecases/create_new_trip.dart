import 'package:cabit/src/core/usecases/usecase.dart';
import 'package:cabit/src/features/trip/domain/entities/trip.dart';
import 'package:cabit/src/features/trip/domain/repositories/trip_repository.dart';

class CreateNewTrip extends UseCase<Trip, Trip> {
  final TripRepository tripRepository;

  CreateNewTrip(this.tripRepository);

  @override
  call(params) async {
    return await tripRepository.createTrip(params);
  }
}
