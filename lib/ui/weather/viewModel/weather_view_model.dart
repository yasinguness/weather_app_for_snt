import 'dart:developer';

import 'package:weather_app_for_snt/network/model/country/country_model.dart';
import 'package:weather_app_for_snt/network/model/weather/weather_model.dart';
import 'package:weather_app_for_snt/network/services/country/country_service.dart';
import 'package:weather_app_for_snt/network/services/weather/weather_service.dart';
import 'package:weather_app_for_snt/ui/base/base_view_model.dart';

class WeatherViewModel extends BaseViewModel {
  WeatherViewModel({required this.weatherService, required this.countryService});
  final WeatherService weatherService;
  final CountryService countryService;

  List<Datum> countryList = [];
  WeatherModel? dailyModel;

  Datum? currentModel;

  Future<void> init() async {
    await getAllCountry();
    await getHourly(currentModel?.coordinates?.latitude ?? 0, currentModel?.coordinates?.longitude ?? 0);
  }

  Future<void> getAllCountry() async {
    setLoading(true);
    final resposne = await countryService.getAllCountry();
    countryList = resposne.data ?? [];
    currentModel = countryList.first;
    setLoading(false);
  }

  Future<void> getHourly(double lat, double long) async {
    setLoading(true);
    dailyModel = await weatherService.dailyWeather(lat, long);
    setLoading(false);
  }

  Future<void> changeCity(Datum newCountry) async {
    currentModel = newCountry;
    getHourly(currentModel?.coordinates?.latitude ?? 0, currentModel?.coordinates?.longitude ?? 0);
    notifyListeners();
  }
}
