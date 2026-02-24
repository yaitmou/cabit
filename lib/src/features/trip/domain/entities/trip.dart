import 'package:cabit/src/core/entities/route.dart';
import 'package:equatable/equatable.dart';

class Trip extends Equatable {
  final Route route;
  final DateTime pickupDate;

  const Trip({required this.route, required this.pickupDate});

  @override
  List<Object?> get props => [route, pickupDate];

  double computeCoste() {
    return 0.0;
  }
}
