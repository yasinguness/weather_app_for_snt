// ignore_for_file: avoid_field_initializers_in_const_classes

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_for_snt/common/extension/widget_extension.dart';
import 'package:weather_app_for_snt/common/widget/custom_drop_down_item.dart';
import 'package:weather_app_for_snt/ui/home/viewModel/home_view_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  final _celcius = 'Celcius';
  final _fahrenheit = 'Fahrenheit';
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, model, child) => Padding(
        padding: context.padding.low,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_title(context), const _CustomSpacer(), _dropDown(model, context)],
        ),
      ),
    );
  }

  DropdownButtonFormField<bool> _dropDown(HomeViewModel model, BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      value: model.isTemperature,
      decoration: const InputDecoration().dropDownDecoration,
      items: _dropDownItems(context),
      onChanged: (value) async {
        await _onChangedFunc(model, value);
      },
    );
  }

  Text _title(BuildContext context) {
    return Text(
      'Change Temperature',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
    );
  }

  List<CustomDropDown<bool>> _dropDownItems(BuildContext context) {
    return [
      CustomDropDown<bool>(childText: _celcius, value: false, context: context),
      CustomDropDown<bool>(
        childText: _fahrenheit,
        value: true,
        context: context,
      ),
    ];
  }

  Future<void> _onChangedFunc(HomeViewModel model, bool? value) async {
    model.changeTemperature(value ?? false);
    await model.getDaily();
    await model.getHourly();
  }
}

class _CustomSpacer extends StatelessWidget {
  const _CustomSpacer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sized.height * 0.008,
    );
  }
}
