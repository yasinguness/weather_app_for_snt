import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_for_snt/common/const/app_colors.dart';
import 'package:weather_app_for_snt/common/enum/image_enum.dart';
import 'package:weather_app_for_snt/common/extension/widget_extension.dart';
import 'package:weather_app_for_snt/common/widget/custom_drop_down_item.dart';
import 'package:weather_app_for_snt/common/widget/custom_indicator.dart';
import 'package:weather_app_for_snt/common/widget/weather_card.dart';
import 'package:weather_app_for_snt/network/model/country/country_model.dart';
import 'package:weather_app_for_snt/ui/home/viewModel/home_view_model.dart';
import 'package:weather_app_for_snt/ui/weather/view/mixin/weather_mixin.dart';

class WeatherView extends StatelessWidget with WeatherMixin {
  WeatherView({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, model, child) => model.isLoading
          ? const CustomCircularIndicator()
          : Column(
              children: [_header(context, model), _dailyItems(context, model)],
            ),
    );
  }

  Container _header(BuildContext context, HomeViewModel model) {
    return Container(
      decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.7)),
      height: context.sized.height * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _dropDownForCountryies(context, model),
          Expanded(
            flex: 4,
            child: _context(model, context),
          ),
        ],
      ),
    );
  }

  SizedBox _dropDownForCountryies(BuildContext context, HomeViewModel model) {
    return SizedBox(
      width: double.infinity,
      child: DropdownButtonFormField(
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.white),
        decoration: const InputDecoration().dropDownDecoration,
        padding: context.padding.low,
        isExpanded: true,
        value: model.currentModel,
        items: _countryItems(model, context),
        onChanged: (value) {
          model.changeCity(value ?? Datum());
        },
      ),
    );
  }

  List<CustomDropDown<Datum>> _countryItems(HomeViewModel model, BuildContext context) {
    return List.generate(model.countryList.length, (index) {
      final current = model.countryList[index];
      return CustomDropDown<Datum>(value: current, context: context, childText: current.name ?? '');
    });
  }

  Row _context(HomeViewModel model, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [_degree(model, context), _image()],
    );
  }

  Text _degree(HomeViewModel model, BuildContext context) {
    return Text(
      "${model.dailyModel?.daily?.temperature2M?[1].toString() ?? ""} ${model.dailyModel?.dailyUnits?.temperature2M ?? ""}",
      style: Theme.of(context).textTheme.displayLarge?.copyWith(color: AppColors.white),
    );
  }

  Image _image() => Image.asset(ImageAssetEnum.rainy.getAsset());

  Padding _dailyItems(BuildContext context, HomeViewModel model) {
    return Padding(
      padding: context.padding.medium / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_title(context), _dailyForeCasts(context, model)],
      ),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      'Daily Forecast',
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
    );
  }

  GridView _dailyForeCasts(BuildContext context, HomeViewModel model) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      children: List.generate(
        4,
        (index) => Padding(
          padding: context.padding.onlyRightLow,
          child: WeatherCard(
            asset: ImageAssetEnum.rainy.getAsset(),
            day: days[index],
            status: '${model.dailyModel?.daily?.temperature2M?[index]} ${model.dailyModel?.dailyUnits?.temperature2M}',
          ),
        ),
      ),
    );
  }
}
