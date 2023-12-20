import 'package:flutter/material.dart';
import 'package:weather_app_for_snt/ui/home/view/home_view.dart';
import 'package:weather_app_for_snt/ui/settings/setting_view.dart';
import 'package:weather_app_for_snt/ui/weather/view/weather_view.dart';

mixin HomeViewMixin on State<HomeView> {
  final homeText = 'Home';
  final settings = 'Settings';

  final pages = [WeatherView(), const SettingsView()];
}
