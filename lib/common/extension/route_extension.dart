import 'package:weather_app_for_snt/common/enum/route_enum.dart';

extension RouteConstExtension on RouteEnum {
  String get route {
    switch (this) {
      case RouteEnum.homeView:
        return '/homeView';
      case RouteEnum.splashView:
        return '/splashView';

      // ignore: no_default_cases
      default:
        return '/';
    }
  }
}
