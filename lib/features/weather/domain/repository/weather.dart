import 'package:weather/features/weather/domain/entity/weather.dart';

import '../../../../core/either.dart';
import '../../../../core/error/failure.dart';

abstract class WeatherRepository {
  const WeatherRepository();
  Future<Either<Failure, WeatherEntity>> getWeather({required String cityName});
}
