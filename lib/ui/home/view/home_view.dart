import 'package:flutter/material.dart';
import 'package:weather_app_for_snt/common/extension/widget_extension.dart';
import 'package:weather_app_for_snt/ui/base/base_view.dart';
import 'package:weather_app_for_snt/ui/home/viewModel/home_view_model.dart';
import 'package:weather_app_for_snt/ui/settings/setting_view.dart';
import 'package:weather_app_for_snt/ui/weather/view/weather_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(),
              bottomNavigationBar:
                  BottomNavigationBar(currentIndex: _selectedIndex, onTap: (value) => _onItemTapped(value), items: [
                BottomNavigationBarItem(icon: Icons.home.icon, label: "Home"),
                BottomNavigationBarItem(icon: Icons.settings.icon, label: "Home"),
              ]),
              body: _pages.elementAt(_selectedIndex),
            ),
        model: HomeViewModel());
  }

  final _pages = [const WeatherView(), const SettingsView()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
