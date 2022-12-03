
import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final String name;
  final String region;
  final double lat;
  final double lon;
  const LocationEntity({
    required this.name,
    required this.region,
    required this.lat,
    required this.lon,
  });

  @override
  List<Object> get props => [name, region, lat, lon];

  @override
  bool get stringify => true;
}
