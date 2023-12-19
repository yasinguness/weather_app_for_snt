import 'package:weather_app_for_snt/common/enum/dio_enum.dart';
import 'package:weather_app_for_snt/network/api/base_service.dart';
import 'package:weather_app_for_snt/network/model/weather/weather_model.dart';

class WeatherService extends BaseService {
  Future<List<WeatherModel>> hourlyWeathers() async {
    final response = await service.make<WeatherModel>("?latitude=52.52&longitude=13.41&hourly=temperature_2m",
        parserModel: WeatherModel(), method: MethodType.GET);
    return response is List<WeatherModel> ? response : <WeatherModel>[];
  }

  Future<WeatherModel> dailyWeather(double lat, double long) async {
    final response = await service.make<WeatherModel>("?latitude=$lat&longitude=$long&daily=temperature_2m_max",
        parserModel: WeatherModel(), method: MethodType.GET);
    return WeatherModel.fromJson(response as Map<String, dynamic>);
  }
}
