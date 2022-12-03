// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather/core/either.dart';
import 'package:weather/core/error/exeptions.dart';
import 'package:weather/core/error/failure.dart';
import 'package:weather/features/weather/data/data_source/weather_remote_data_source.dart';
import 'package:weather/features/weather/domain/entity/weather.dart';
import 'package:weather/features/weather/domain/repository/weather.dart';

import '../model/weather_adapter.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource _weatherRemoteDataSource;
  const WeatherRepositoryImpl({
    required WeatherRemoteDataSource weatherRemoteDataSource,
  }) : _weatherRemoteDataSource = weatherRemoteDataSource;

  @override
  Future<Either<Failure, WeatherEntity>> getWeather({
    required String cityName,
  }) async {
    try {
      final response =
          await _weatherRemoteDataSource.getWeather(cityName: cityName);

      return Right(
        WeatherAdopter.getWeatherEntityFromWeatherModel(weather: response),
      );
    } on ServerException catch (error) {
      return Left(ServerFailure(
        errorMessage: error.statusMessage,
        statusCode: error.statusCode,
      ));
    }
  }
}
