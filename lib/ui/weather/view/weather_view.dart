import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:weather_app_for_snt/common/const/app_colors.dart';
import 'package:weather_app_for_snt/common/widget/weather_card.dart';
import 'package:weather_app_for_snt/network/model/country/country_model.dart';
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
        p0.init();
      },
      model: WeatherViewModel(weatherService: WeatherService(), countryService: CountryService()),
      builder: (context, model, child) => model.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.7)),
                  height: context.sized.height * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: DropdownButton(
                          padding: context.padding.low,
                          isExpanded: true,
                          value: model.currentModel,
                          items: List.generate(model.countryList.length, (index) {
                            final current = model.countryList[index];
                            return DropdownMenuItem<Datum>(
                                value: current,
                                child: Text(
                                  current.name ?? "",
                                ));
                          }),
                          onChanged: (value) {
                            model.changeCity(value ?? Datum());
                          },
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "${model.dailyModel?.daily?.temperature2M?.first.toString() ?? ""} ${model.dailyModel?.dailyUnits?.temperature2M ?? ""}",
                              style: Theme.of(context).textTheme.displayLarge?.copyWith(color: AppColors.white),
                            ),
                            Image.asset("assets/image/sunny.png")
                          ],
                        ),
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
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        children: List.generate(
                            4,
                            (index) => Padding(
                                  padding: context.padding.onlyRightLow,
                                  child: const WeatherCard(),
                                )),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
