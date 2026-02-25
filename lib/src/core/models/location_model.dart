import 'package:cabit/src/core/entities/location.dart';

class LocationModel extends Location {
  const LocationModel({required super.lat, required super.lon, required super.placeName});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      placeName: json['placeName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'lon': lon, 'placeName': placeName};
  }

  factory LocationModel.fromEntity(Location entity) {
    return LocationModel(lat: entity.lat, lon: entity.lon, placeName: entity.placeName);
  }

  Location toEntity() {
    return Location(lat: lat, lon: lon, placeName: placeName);
  }

  LocationModel copyWith({double? lat, double? lon, String? placeName}) {
    return LocationModel(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      placeName: placeName ?? this.placeName,
    );
  }

  @override
  List<Object?> get props => [lat, lon, placeName];
}
