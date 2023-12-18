import 'dart:convert';

import 'package:dio/browser.dart';
import 'package:dio/dio.dart';
import 'package:weather_app_for_snt/common/base/api_const.dart';
import 'package:weather_app_for_snt/common/enum/dio_enum.dart';
import 'package:weather_app_for_snt/network/api/base_methods.dart';
import 'package:weather_app_for_snt/network/model/base/base_model.dart';

class WeatherDio extends BaseMethods implements Dio {
  WeatherDio._init() {
    String baseUrl = ApiConst.weather;

    options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    httpClientAdapter = BrowserHttpClientAdapter();
    interceptors.add(LogInterceptor(responseBody: true));
  }

  static WeatherDio? _instance;

  static WeatherDio get instance {
    _instance ??= WeatherDio._init();
    return _instance!;
  }
}
