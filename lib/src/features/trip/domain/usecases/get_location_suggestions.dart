import 'package:cabit/src/core/entities/location.dart';
import 'package:cabit/src/core/types/result.dart';
import 'package:cabit/src/core/usecases/usecase.dart';
import 'package:cabit/src/features/trip/domain/repositories/trip_repository.dart';

class GetLocationSuggestions extends UseCase<List<Location>, String> {
  final TripRepository repository;

  GetLocationSuggestions(this.repository);
  @override
  call(params) async {
    if (params.isEmpty) {
      return const Result(value: []);
    }
    return await repository.getSuggestions(params);
  }
}
