import 'package:dio/dio.dart';
import 'package:weather_app_for_snt/common/base/api_const.dart';
import 'package:weather_app_for_snt/network/api/base/base_methods.dart';

class CountryDio extends BaseMethods implements Dio {
  CountryDio._init() {
    const baseUrl = ApiConst.country;

    options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    httpClientAdapter = HttpClientAdapter();
    interceptors.add(LogInterceptor(responseBody: true));
  }

  static CountryDio? _instance;

  static CountryDio get instance {
    _instance ??= CountryDio._init();
    return _instance!;
  }
}
