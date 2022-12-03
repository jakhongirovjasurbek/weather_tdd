import 'package:equatable/equatable.dart';
import 'package:weather/features/weather/domain/entity/location.dart';

class WeatherEntity extends Equatable {
  final LocationEntity location;
  const WeatherEntity({required this.location});

  @override
  List<Object?> get props => [location];

  @override
  bool get stringify => true;
}
