import 'package:weather/features/weather/data/model/weather.dart';

import '../../domain/entity/location.dart';
import '../../domain/entity/weather.dart';

abstract class WeatherAdopter {
  static WeatherEntity getWeatherEntityFromWeatherModel({
    required WeatherModel weather,
  }) {
    return WeatherEntity(
        location: LocationEntity(
      name: weather.location.name,
      region: weather.location.region,
      lat: weather.location.lat,
      lon: weather.location.lon,
    ));
  }
}
