import 'package:flutter/material.dart';
import 'package:weather_app_for_snt/common/const/app_colors.dart';
import 'package:weather_app_for_snt/network/services/country/country_service.dart';
import 'package:weather_app_for_snt/network/services/weather/weather_service.dart';
import 'package:weather_app_for_snt/ui/base/base_view.dart';
import 'package:weather_app_for_snt/ui/weather/viewModel/weather_view_model.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<WeatherViewModel>(
      onModelReady: (p0) {
        p0.getAllCountry();
        p0.getHourly();
      },
      model: WeatherViewModel(weatherService: WeatherService(), countryService: CountryService()),
      builder: (context, model, child) => Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: AppColors.primary),
            height: 300,
            child: Column(
              children: [
                DropdownButton(
                  items: List.generate(model.countryList.length,
                      (index) => DropdownMenuItem(child: Text(model.countryList.first.data?[index].name ?? ""))),
                  onChanged: (value) {},
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        "18 derece",
                      ),
                    ),
                    Expanded(child: Icon(Icons.abc))
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Daily Forecast",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          color: AppColors.textColor.withOpacity(0.2)),
                      height: 100,
                      width: 80,
                      child: const Text("data"),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          color: AppColors.textColor.withOpacity(0.2)),
                      height: 100,
                      width: 80,
                      child: const Text("data"),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
