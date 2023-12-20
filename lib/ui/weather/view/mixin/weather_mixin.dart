import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:weather_app_for_snt/common/enum/image_enum.dart';
import 'package:weather_app_for_snt/common/extension/widget_extension.dart';
import 'package:weather_app_for_snt/common/widget/weather_card.dart';
import 'package:weather_app_for_snt/network/model/hourly/hourly_model.dart';

mixin WeatherMixin {
  final days = ['Monday', 'Today', 'Wednesday', 'Thursday'];
  final hours = ['Now', '12PM', '1PM', '2PM'];
}

class HourlyGrid extends GridView {
  HourlyGrid({required BuildContext context, required List<String> texts, required HourlyModel model, super.key})
      : super.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          children: List.generate(
            4,
            (index) {
              return Padding(
                padding: context.padding.onlyRightLow,
                child: WeatherCard(
                  asset: ImageAssetEnum.rainy.getAsset(),
                  day: texts[index],
                  status: '${model.hourly?.temperature2M?[index]} ${model.hourlyUnits?.temperature2M}',
                ),
              );
            },
          ),
        );
}
