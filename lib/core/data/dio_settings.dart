import 'package:dio/dio.dart';
import 'package:weather/core/data/storage_repository.dart';

class DioSettings {
  Dio _dioBaseOptions = Dio(BaseOptions(
    baseUrl: 'https://api.weatherapi.com/v1',
    connectTimeout: 35000,
    receiveTimeout: 33000,
    followRedirects: false,
    headers: <String, dynamic>{
      'Accept-Language': StorageRepository.getString('language', defValue: 'en')
    },
    validateStatus: (status) => status != null && status <= 500,
  ))
    ..interceptors.addAll([]);

  void setBaseOptions({String? lang, String? baseUrl}) {
    _dioBaseOptions = Dio(BaseOptions(
      baseUrl: baseUrl ?? 'https://api.weatherapi.com/v1',
      connectTimeout: 35000,
      receiveTimeout: 33000,
      headers: <String, dynamic>{'Accept-Language': lang},
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    ))
      ..interceptors.addAll([]);
  }

  Dio get dio => _dioBaseOptions;
}
