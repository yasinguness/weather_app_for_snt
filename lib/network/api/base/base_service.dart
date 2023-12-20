import 'package:weather_app_for_snt/network/api/country_dio.dart';
import 'package:weather_app_for_snt/network/api/weather_dio.dart';

class BaseService {
  WeatherDio service = WeatherDio.instance;
  CountryDio countryDio = CountryDio.instance;
}
