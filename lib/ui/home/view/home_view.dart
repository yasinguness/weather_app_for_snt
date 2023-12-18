import 'package:flutter/material.dart';
import 'package:weather_app_for_snt/ui/base/base_view.dart';
import 'package:weather_app_for_snt/ui/home/viewModel/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        builder: (context, model, child) => const Scaffold(
              body: Text("data"),
            ),
        model: HomeViewModel());
  }
}
