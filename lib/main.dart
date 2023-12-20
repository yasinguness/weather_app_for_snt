import 'package:flutter/material.dart';
import 'package:weather_app_for_snt/common/enum/route_enum.dart';
import 'package:weather_app_for_snt/common/extension/route_extension.dart';
import 'package:weather_app_for_snt/common/theme/theme_data.dart';
import 'package:weather_app_for_snt/common/router/router.dart' as router;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: CustomThemeData.weatherTheme,
      initialRoute: RouteEnum.splashView.route,
      onGenerateRoute: router.generateRoute,
    );
  }
}
