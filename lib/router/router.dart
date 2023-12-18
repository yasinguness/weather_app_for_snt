import 'package:flutter/material.dart';
import 'package:weather_app_for_snt/common/const/route_const.dart';
import 'package:weather_app_for_snt/ui/home/view/home_view.dart';
import 'package:weather_app_for_snt/ui/splash/view/splash_view.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteConst.homeView:
      return MaterialPageRoute(
        builder: (context) => const HomeView(),
      );
    case RouteConst.splashView:
      return MaterialPageRoute(
        builder: (context) {
          return const SplashView();
        },
      );

    default:
  }
  return null;
}
