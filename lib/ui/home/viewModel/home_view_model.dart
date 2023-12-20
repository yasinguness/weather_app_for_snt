import 'package:weather_app_for_snt/common/manager/locale_manager.dart';
import 'package:weather_app_for_snt/network/model/country/country_model.dart';
import 'package:weather_app_for_snt/network/model/hourly/hourly_model.dart';
import 'package:weather_app_for_snt/network/model/weather/weather_model.dart';
import 'package:weather_app_for_snt/network/services/country/country_service.dart';
import 'package:weather_app_for_snt/network/services/weather/weather_service.dart';
import 'package:weather_app_for_snt/ui/base/base_view_model.dart';

/// Normalde projelerimde her view'im için genel olarak bir ViewModel yapmaya çalışırım.
/// Ancak proje çok simple olduğu için logic ve state işlemlerimi homeViewModel'de yaptım.
/// HomeVieWModel'i mi ChangeNotifier ile extend ederek herhangi bir değişikliği ve state yönetimini
/// Provider aracılığıyla View'larıma aktarmış oldum.
class HomeViewModel extends BaseViewModel {
  HomeViewModel({required this.weatherService, required this.countryService});
  final WeatherService weatherService;
  final CountryService countryService;

  /// Temperature değeri bizden 2 seçenek alabileceği için LocaleManagerimizde boolean bir değer olarak tuttum.
  /// Fazladan bir servis daha yazmak yerine uygulamam init olduğunda gelen temperature değerini
  /// requestime parametre olarak gönderdim. Eğer temperature true ise Fahrenheit, değil ise celcius seçili demektir.
  final LocaleManager _localeManager = LocaleManager.instance;

  List<Datum> countryList = [];

  WeatherModel? dailyModel;
  HourlyModel? hourlyModel;

  int selectedIndex = 0;

  Datum? currentModel;
  bool? isTemperature;
  Future<void> init() async {
    await getAllCountry();
    await getDaily();
    await getHourly();
  }

  Future<void> getAllCountry() async {
    setLoading(true);
    final resposne = await countryService.getAllCountry();
    countryList = resposne.data ?? [];
    currentModel = countryList.first;
    setLoading(false);
  }

  Future<void> getDaily() async {
    setLoading(true);
    isTemperature = _localeManager.getBoolValue(PreferencesKeys.Temperature);
    dailyModel = await weatherService.dailyWeather(
      currentModel?.coordinates?.latitude ?? 0,
      currentModel?.coordinates?.longitude ?? 0,
      isTemperature ?? false,
    );
    setLoading(false);
  }

  Future<void> getHourly() async {
    setLoading(true);
    isTemperature = _localeManager.getBoolValue(PreferencesKeys.Temperature);
    hourlyModel = await weatherService.hourlyWeathers(
      currentModel?.coordinates?.latitude ?? 0,
      currentModel?.coordinates?.longitude ?? 0,
      isTemperature ?? false,
    );
    setLoading(false);
  }

  Future<void> changeCity(Datum newCountry) async {
    currentModel = newCountry;
    await getDaily();
    await getHourly();
    notifyListeners();
  }

  void changeTemperature(bool newTemp) {
    _localeManager.setBooleanValue(PreferencesKeys.Temperature, newTemp);
    notifyListeners();
  }

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
