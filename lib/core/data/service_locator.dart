import 'package:get_it/get_it.dart';
import 'package:weather/core/data/dio_settings.dart';

final serviceLocator = GetIt.instance;

void setupLocator() {
  serviceLocator.registerLazySingleton(DioSettings.new);

 
}
