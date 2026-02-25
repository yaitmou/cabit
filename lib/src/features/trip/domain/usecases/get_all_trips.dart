import 'package:cabit/src/core/usecases/usecase.dart';
import 'package:cabit/src/features/trip/domain/entities/trip.dart';
import 'package:cabit/src/features/trip/domain/repositories/trip_repository.dart';

class GetAllTrips extends UseCase<List<Trip>, NoParams> {
  final TripRepository tripRepository;

  GetAllTrips(this.tripRepository);

  @override
  call(params) async {
    return await tripRepository.getAllTrips();
  }
}
