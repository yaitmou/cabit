import 'package:equatable/equatable.dart';

class Route extends Equatable {
  final double lat;
  final double lon;
  final String placeName;

  const Route({required this.lat, required this.lon, required this.placeName});
  @override
  List<Object?> get props => throw UnimplementedError();
}
