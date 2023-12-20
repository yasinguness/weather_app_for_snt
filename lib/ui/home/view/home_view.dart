import 'package:flutter/material.dart';
import 'package:weather_app_for_snt/common/extension/widget_extension.dart';
import 'package:weather_app_for_snt/network/services/country/country_service.dart';
import 'package:weather_app_for_snt/network/services/weather/weather_service.dart';
import 'package:weather_app_for_snt/ui/base/base_view.dart';
import 'package:weather_app_for_snt/ui/home/view/mixin/home_view_mixin.dart';
import 'package:weather_app_for_snt/ui/home/viewModel/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (p0) {
        p0.init();
      },
      builder: (context, model, child) => Scaffold(
        appBar: _appBar(),
        bottomNavigationBar: _bottomNavBar(model),
        body: pages.elementAt(model.selectedIndex),
      ),
      model: HomeViewModel(countryService: CountryService(), weatherService: WeatherService()),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Weather'),
      automaticallyImplyLeading: false,
    );
  }

  BottomNavigationBar _bottomNavBar(HomeViewModel model) {
    return BottomNavigationBar(
      currentIndex: model.selectedIndex,
      onTap: (value) => model.onItemTapped(value),
      items: [
        BottomNavigationBarItem(icon: Icons.home.icon, label: homeText),
        BottomNavigationBarItem(icon: Icons.settings.icon, label: settings),
      ],
    );
  }
}
