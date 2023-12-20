import 'package:weather_app_for_snt/common/enum/dio_enum.dart';
import 'package:weather_app_for_snt/network/api/base/base_service.dart';
import 'package:weather_app_for_snt/network/model/hourly/hourly_model.dart';
import 'package:weather_app_for_snt/network/model/weather/weather_model.dart';

class WeatherService extends BaseService {
  Future<HourlyModel> hourlyWeathers(double lat, double long, bool isFahrenheit) async {
    final response = await service.make<HourlyModel>(
      isFahrenheit
          ? '?latitude=$lat&longitude=$long&hourly=temperature_2m&temperature_unit=fahrenheit'
          : '?latitude=$lat&longitude=$long&hourly=temperature_2m',
      parserModel: HourlyModel(),
      method: MethodType.GET,
    );
    return HourlyModel.fromJson(response as Map<String, dynamic>);
  }

  /// Günlük hava durumu için bu isteği kullandım. Seçilecek şehrin [lat] ve [long] değerini parametre olarak gönderdim.
  /// [isFahrenheit] değerini kontrol ederek requestimin pathini değiştirdim. Bir method daha
  /// yazılabilinip böyle bir conditiona gerek kalmayabilirdi . Ancak proje komplike olmadığı için böyle bir yol kullandım.
  Future<WeatherModel> dailyWeather(double lat, double long, bool isFahrenheit) async {
    final response = await service.make<WeatherModel>(
      isFahrenheit
          ? '?latitude=$lat&longitude=$long&daily=temperature_2m_max&temperature_unit=fahrenheit'
          : '?latitude=$lat&longitude=$long&daily=temperature_2m_max',
      parserModel: WeatherModel(),
      method: MethodType.GET,
    );
    return WeatherModel.fromJson(response as Map<String, dynamic>);
  }
}
