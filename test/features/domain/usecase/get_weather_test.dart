import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/core/either.dart';
import 'package:weather/core/error/failure.dart';
import 'package:weather/features/weather/domain/entity/location.dart';
import 'package:weather/features/weather/domain/entity/weather.dart';
import 'package:weather/features/weather/domain/repository/weather.dart';
import 'package:weather/features/weather/domain/usecase/get_weather.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late GetWeatherUseCase getWeatherUseCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getWeatherUseCase = GetWeatherUseCase(
      repository: mockWeatherRepository,
    );
  });

  test(
    'weather repository needs to be used once',
    () async {
      const tCityName = 'London';
      const tWeatherEntity = WeatherEntity(
        location: LocationEntity(
          name: 'London',
          region: 'UK',
          lat: 0.0,
          lon: 0.0,
        ),
      );
      when(() => mockWeatherRepository.getWeather(cityName: tCityName))
          .thenAnswer(
        (_) async => Right(tWeatherEntity),
      );

      final response = await getWeatherUseCase.call(tCityName);

      verify(
        () => mockWeatherRepository.getWeather(cityName: tCityName),
      ).called(1);
    },
  );

  test(
    'return right when getWeather() returns right value',
    () async {
      const tCityName = 'London';
      const tWeatherEntity = WeatherEntity(
        location: LocationEntity(
          name: 'London',
          region: 'UK',
          lat: 0.0,
          lon: 0.0,
        ),
      );
      when(() => mockWeatherRepository.getWeather(cityName: tCityName))
          .thenAnswer(
        (_) async => Right(tWeatherEntity),
      );

      final response = await getWeatherUseCase.call(tCityName);

      expect(response, isA<Right<Failure, WeatherEntity>>());
    },
  );

  test(
    'return left when getWeather() returns left value',
    () async {
      const tCityName = 'London';

      when(() => mockWeatherRepository.getWeather(cityName: tCityName))
          .thenAnswer(
        (_) async => Left(const ServerFailure()),
      );

      final response = await getWeatherUseCase.call(tCityName);

      expect(response, isA<Left<Failure, WeatherEntity>>());
    },
  );
}
