import 'package:weather_app_for_snt/common/enum/dio_enum.dart';
import 'package:weather_app_for_snt/network/api/base/base_service.dart';
import 'package:weather_app_for_snt/network/model/weather/weather_model.dart';

class WeatherService extends BaseService {
  /// Bu isteği yazdım ancak kullanmadım.
  Future<List<WeatherModel>> hourlyWeathers() async {
    final response = await service.make<WeatherModel>(
      '?latitude=52.52&longitude=13.41&hourly=temperature_2m',
      parserModel: WeatherModel(),
      method: MethodType.GET,
    );
    return response is List<WeatherModel> ? response : <WeatherModel>[];
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
