import 'package:cabit/src/core/entities/route.dart';

class RouteModel extends Route {
  const RouteModel({required super.lat, required super.lon, required super.placeName});

  factory RouteModel.fromJson(Map<String, dynamic> json) {
    return RouteModel(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      placeName: json['placeName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'lon': lon, 'placeName': placeName};
  }

  factory RouteModel.fromEntity(Route entity) {
    return RouteModel(lat: entity.lat, lon: entity.lon, placeName: entity.placeName);
  }

  Route toEntity() {
    return Route(lat: lat, lon: lon, placeName: placeName);
  }

  RouteModel copyWith({double? lat, double? lon, String? placeName}) {
    return RouteModel(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      placeName: placeName ?? this.placeName,
    );
  }

  @override
  List<Object?> get props => [lat, lon, placeName];
}
