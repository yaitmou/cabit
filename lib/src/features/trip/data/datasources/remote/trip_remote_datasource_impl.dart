import 'dart:convert';

import 'package:cabit/src/core/types/result.dart';
import 'package:cabit/src/features/trip/data/datasources/remote/trip_remote_datasource.dart';
import 'package:cabit/src/features/trip/data/models/trip_model.dart';
import 'package:cabit/src/features/trip/domain/entities/trip.dart';

class TripRemoteDatasourceImpl implements TripRemoteDataSource {
  static String pickupDateJSON = DateTime.now().toIso8601String();
  String tripJSON =
      """{
    'route': {'lat': 25.312508, 'lon': 51.444721, 'placeName': 'oxygen park'},
    'pickupDate': $pickupDateJSON,
  }""";

  @override
  Future<Result<Trip>> createTrip(Trip trip) {
    // called the server and we received a success response
    final map = json.decode(tripJSON) as Map<String, dynamic>;
    final trip = TripModel.fromJson(map).toEntity();

    return Future.value(Result(value: trip));
  }
}
