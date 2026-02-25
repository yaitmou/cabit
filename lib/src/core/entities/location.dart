import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final double lat;
  final double lon;
  final String placeName;

  const Location({required this.lat, required this.lon, required this.placeName});
  @override
  List<Object?> get props => [lat, lon, placeName];
}
