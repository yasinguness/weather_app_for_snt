import 'package:weather_app_for_snt/network/model/country/country_model.dart';
import 'package:weather_app_for_snt/network/model/weather/weather_model.dart';
import 'package:weather_app_for_snt/network/services/country/country_service.dart';
import 'package:weather_app_for_snt/network/services/weather/weather_service.dart';
import 'package:weather_app_for_snt/ui/base/base_view_model.dart';

class WeatherViewModel extends BaseViewModel {
  WeatherViewModel({required this.weatherService, required this.countryService});
  final WeatherService weatherService;
  final CountryService countryService;

  List<CountryModel> countryList = [];
  List<WeatherModel> hourlyList = [];

  Future<void> getAllCountry() async {
    setLoading(true);
    countryList = await countryService.getAllCountry();
    setLoading(false);
  }

  Future<void> getHourly() async {
    setLoading(true);
    hourlyList = await weatherService.dailyWeather();
    setLoading(false);
  }
}
