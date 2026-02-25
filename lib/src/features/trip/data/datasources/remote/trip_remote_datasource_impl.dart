import 'dart:convert';
import 'package:cabit/src/core/models/location_model.dart';
import 'package:http/http.dart' as http;

import 'package:cabit/src/features/trip/data/datasources/remote/trip_remote_datasource.dart';
import 'package:cabit/src/features/trip/data/models/trip_model.dart';
import 'package:cabit/src/features/trip/domain/entities/trip.dart';

class TripRemoteDatasourceImpl implements TripRemoteDataSource {
  final http.Client client;

  TripRemoteDatasourceImpl({required this.client});

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

  @override
  Future<List<LocationModel>> getSuggestions(String query) async {
    final url = Uri.parse(
      'https://nominatim.openstreetmap.org/search?q=$query&format=json&addressdetails=1&limit=5',
    );

    final response = await client.get(
      url,
      headers: {'User-Agent': 'CabBookingApp'}, // Nominatim requires a User-Agent
    );

    if (response.statusCode == 200) {
      final List decoded = json.decode(response.body);
      return decoded.map((item) => LocationModel.fromJson(item)).toList();
    } else {
      throw Exception(); // Use your existing exception classes
    }
  }
}
