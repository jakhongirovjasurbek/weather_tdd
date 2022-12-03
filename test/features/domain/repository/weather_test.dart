import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/core/either.dart';
import 'package:weather/core/error/failure.dart';
import 'package:weather/features/weather/domain/entity/location.dart';
import 'package:weather/features/weather/domain/entity/weather.dart';
import 'package:weather/features/weather/domain/repository/weather.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
  });

  group(
    'should test getWeather() function',
    () {
      test(
        'return weather entity when server returns weather model',
        () async {
          // arrange

          when(() => mockWeatherRepository.getWeather(cityName: 'London'))
              .thenAnswer(
            (_) async => Right(
              const WeatherEntity(
                location: LocationEntity(
                  name: 'London',
                  region: 'UK',
                  lat: 0.0,
                  lon: 0.0,
                ),
              ),
            ),
          );

          // act

          final response =
              await mockWeatherRepository.getWeather(cityName: 'London');
          // expect - verify

          expect(response, isA<Right<Failure, WeatherEntity>>());

          verify(
            () => mockWeatherRepository.getWeather(cityName: 'London'),
          ).called(1);
        },
      );

      test(
        'return failure when server throws exception',
        () async {
          // arrange

          when(() => mockWeatherRepository.getWeather(cityName: 'London'))
              .thenAnswer(
            (_) async => Left(
              const ServerFailure(errorMessage: '', statusCode: 0),
            ),
          );

          // act

          final response =
              await mockWeatherRepository.getWeather(cityName: 'London');
          // expect - verify

          expect(response, isA<Left<Failure, WeatherEntity>>());

          verify(
            () => mockWeatherRepository.getWeather(cityName: 'London'),
          ).called(1);
        },
      );
    },
  );
}
