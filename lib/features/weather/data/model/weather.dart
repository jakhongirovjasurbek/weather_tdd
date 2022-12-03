import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/features/weather/data/model/location.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@Freezed()
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    @Default(LocationModel()) LocationModel location,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, Object?> json) =>
      _$WeatherModelFromJson(json);
}
