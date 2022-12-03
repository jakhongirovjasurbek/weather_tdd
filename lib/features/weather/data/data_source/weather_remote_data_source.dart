import '../model/weather.dart';

abstract class WeatherRemoteDataSource {
  /// Calls {baseUrl}/contact.json/key=[key]&city=[city] api, Method: GET
  /// 
  /// Throws ServerException for any kind of error
  Future<WeatherModel> getWeather({required cityName});
}

class WeatherRemoteDataSourceImple extends WeatherRemoteDataSource {
  @override
  Future<WeatherModel> getWeather({required cityName}) {
    // TODO: implement getWeather
    throw UnimplementedError();
  }
}