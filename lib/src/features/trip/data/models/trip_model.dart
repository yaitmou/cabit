import 'package:cabit/src/core/entities/route.dart' as route_entity;
import 'package:cabit/src/core/models/route_model.dart';
import 'package:cabit/src/features/trip/domain/entities/trip.dart';

class TripModel extends Trip {
  const TripModel({required super.route, required super.pickupDate});

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      route: RouteModel.fromJson(json['route'] as Map<String, dynamic>),
      pickupDate: DateTime.parse(json['pickupDate'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {'route': (route as RouteModel).toJson(), 'pickupDate': pickupDate.toIso8601String()};
  }

  factory TripModel.fromEntity(Trip entity) {
    return TripModel(
      route: entity.route is RouteModel
          ? entity.route as RouteModel
          : RouteModel.fromEntity(entity.route),
      pickupDate: entity.pickupDate,
    );
  }

  Trip toEntity() {
    return Trip(route: route, pickupDate: pickupDate);
  }

  TripModel copyWith({route_entity.Route? route, DateTime? pickupDate}) {
    return TripModel(route: route ?? this.route, pickupDate: pickupDate ?? this.pickupDate);
  }

  @override
  List<Object?> get props => [route, pickupDate];
}
