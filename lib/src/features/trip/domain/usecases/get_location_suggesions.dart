import 'package:cabit/src/core/entities/location.dart';
import 'package:cabit/src/core/types/result.dart';
import 'package:cabit/src/features/trip/domain/repositories/trip_repository.dart';

class GetLocationSuggestions {
  final TripRepository repository;

  GetLocationSuggestions(this.repository);

  Future<Result<List<Location>>> call(String query) async {
    if (query.isEmpty) {
      return const Result(value: []);
    }
    return await repository.getSuggestions(query);
  }
}
