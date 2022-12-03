import 'package:flutter_test/flutter_test.dart';
import 'package:weather/features/weather/data/model/weather.dart';

void main() {
  late WeatherModel tWeatherModel;

  setUp(() {
    tWeatherModel = const WeatherModel();
  });

  test('return empty weather if json is empty', () {
    final convertedJson = WeatherModel.fromJson({});

    expect(tWeatherModel, equals(convertedJson));
  });
  // group('description', body)
}
