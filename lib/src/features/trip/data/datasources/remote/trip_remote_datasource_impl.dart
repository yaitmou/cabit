import 'package:cabit/src/core/models/route_model.dart';
import 'package:cabit/src/core/types/result.dart';
import 'package:cabit/src/features/trip/data/datasources/remote/tirp_remote_datasource.dart';
import 'package:cabit/src/features/trip/data/models/trip_model.dart';

class TripRemoteDatasourceImpl implements TripRemoteDataSource {
  @override
  Future<Result<TripModel>> createTrip(TripModel trip) {
    final tripModel = TripModel(
      route: RouteModel(lat: 25.312508, lon: 51.444721, placeName: 'oxygen park'),
      pickupDate: DateTime.now(),
    );

    return Future.value(Result(value: tripModel));
  }
}
