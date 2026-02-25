import 'package:cabit/src/core/entities/location.dart';
import 'package:equatable/equatable.dart';

class Route extends Equatable {
  final Location from;
  final Location to;

  const Route({required this.from, required this.to});
  @override
  List<Object?> get props => [from, to];
}
