import 'package:weather_app_for_snt/common/enum/dio_enum.dart';
import 'package:weather_app_for_snt/network/api/base/base_service.dart';
import 'package:weather_app_for_snt/network/model/country/country_model.dart';

class CountryService extends BaseService {
  /// Tüm şehirleri dönen isteğim aşağıdaki gibidir.
  Future<CountryModel> getAllCountry() async {
    final response =
        await countryDio.make<CountryModel>('provinces', parserModel: CountryModel(), method: MethodType.GET);
    return CountryModel.fromJson(response as Map<String, dynamic>);
  }
}
