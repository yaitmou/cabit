import 'package:cabit/src/core/entities/route.dart';
import 'package:cabit/src/core/models/location_model.dart';

class RouteModel extends Route {
  const RouteModel({required super.from, required super.to});

  factory RouteModel.fromJson(Map<String, dynamic> json) {
    return RouteModel(
      from: LocationModel.fromJson(json['fom'] as Map<String, dynamic>).toEntity(),
      to: LocationModel.fromJson(json['to'] as Map<String, dynamic>).toEntity(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': LocationModel.fromEntity(from).toJson(),
      'to': LocationModel.fromEntity(to).toJson(),
    };
  }

  factory RouteModel.fromEntity(Route entity) {
    return RouteModel(from: entity.from, to: entity.to);
  }

  Route toEntity() {
    return Route(from: from, to: to);
  }

  @override
  List<Object?> get props => [from, to];
}
