import 'package:dio/dio.dart';
import 'package:weather_app_for_snt/common/base/api_const.dart';
import 'package:weather_app_for_snt/network/api/base/base_methods.dart';

class WeatherDio extends BaseMethods implements Dio {
  WeatherDio._init() {
    const baseUrl = ApiConst.weather;

    options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    httpClientAdapter = HttpClientAdapter();
    interceptors.add(LogInterceptor(responseBody: true));
  }

  static WeatherDio? _instance;

  static WeatherDio get instance {
    _instance ??= WeatherDio._init();
    return _instance!;
  }
}
