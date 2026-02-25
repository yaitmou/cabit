import 'dart:convert';

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
  Future<Trip> createTrip(Trip trip) {
    // called the server and we received a success response
    final map = json.decode(tripJSON) as Map<String, dynamic>;
    final trip = TripModel.fromJson(map).toEntity();

    return Future.value(trip);
  }

  @override
  Future<List<Trip>> getAllTrips() {
    String listOfJsonTrips =
        """[{
    'route': {'lat': 25.312508, 'lon': 51.444721, 'placeName': 'oxygen park'},
    'pickupDate': $pickupDateJSON,
  },
  {
    'route': {'lat': 25.312508, 'lon': 51.444721, 'placeName': 'oxygen park'},
    'pickupDate': $pickupDateJSON,
  },{
    'route': {'lat': 25.312508, 'lon': 51.444721, 'placeName': 'oxygen park'},
    'pickupDate': $pickupDateJSON,
  }]
  """;

    final listMap = json.decode(listOfJsonTrips) as List<Map<String, dynamic>>;
    final trips = listMap.map((t) => TripModel.fromJson(t).toEntity()).toList();

    return Future.value(trips);
  }
}
