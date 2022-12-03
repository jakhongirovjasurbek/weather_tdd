import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/core/either.dart';
import 'package:weather/core/error/exeptions.dart';
import 'package:weather/core/error/failure.dart';
import 'package:weather/features/weather/data/data_source/weather_remote_data_source.dart';
import 'package:weather/features/weather/data/model/weather.dart';
import 'package:weather/features/weather/data/repository/weather.dart';
import 'package:weather/features/weather/domain/entity/weather.dart';
import 'package:weather/features/weather/domain/repository/weather.dart';

class MockWeatherRemoteDataSource extends Mock
    implements WeatherRemoteDataSource {}

void main() {
  late WeatherRepository weatherRepository;
  late MockWeatherRemoteDataSource mockWeatherRemoteDataSource;

  setUp(() {
    mockWeatherRemoteDataSource = MockWeatherRemoteDataSource();
    weatherRepository = WeatherRepositoryImpl(
      weatherRemoteDataSource: mockWeatherRemoteDataSource,
    );
  });

  test(
    '''
    return weather entity (Right) if server returns valid data &
    check if getWeather() function of remote data source is called once
    
    ''',
    () async {
      const tCityName = 'Tashkent';
      when(() => mockWeatherRemoteDataSource.getWeather(cityName: tCityName))
          .thenAnswer(
        (_) async => const WeatherModel(),
      );

      final response = await weatherRepository.getWeather(cityName: tCityName);

      expect(response, isA<Right<Failure, WeatherEntity>>());

      verify(() => mockWeatherRemoteDataSource.getWeather(cityName: tCityName))
          .called(1);
    },
  );

  test(
    'return ServerFailure (Left) if server throws exception',
    () async {
      const tCityName = 'Tashkent';
      when(() => mockWeatherRemoteDataSource.getWeather(cityName: tCityName))
          .thenThrow(ServerException(statusMessage: '', statusCode: 0));

      final response = await weatherRepository.getWeather(cityName: tCityName);

      expect(response, isA<Left<Failure, WeatherEntity>>());

      verify(() => mockWeatherRemoteDataSource.getWeather(cityName: tCityName))
          .called(1);
    },
  );
}
