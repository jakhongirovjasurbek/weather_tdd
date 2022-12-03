import 'package:weather/core/error/failure.dart';
import 'package:weather/core/either.dart';
import 'package:weather/core/usecases/usecase.dart';
import 'package:weather/features/weather/domain/entity/weather.dart';
import 'package:weather/features/weather/domain/repository/weather.dart';

class GetWeatherUseCase implements UseCase<WeatherEntity, String> {
  final WeatherRepository _repository;

  const GetWeatherUseCase({required WeatherRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, WeatherEntity>> call(String params) {
    return _repository.getWeather(cityName: params);
  }
}
