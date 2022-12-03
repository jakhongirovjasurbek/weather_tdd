import 'package:freezed_annotation/freezed_annotation.dart';
part 'location.freezed.dart';
part 'location.g.dart';

@Freezed()
class LocationModel with _$LocationModel {
  const factory LocationModel({
    @Default('') String name,
    @Default('') String region,
    @Default(0.0) double lat,
    @Default(0.0) double lon,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, Object?> json) =>
      _$LocationModelFromJson(json);
}
