import 'package:flutter/material.dart';
import 'package:weather_app_for_snt/common/const/app_colors.dart';
import 'package:weather_app_for_snt/common/enum/image_enum.dart';
import 'package:weather_app_for_snt/common/utility/app_padding.dart';

extension IconExtension on IconData {
  Icon get icon => Icon(this);
}

extension DropDownDecorationExtension on InputDecoration {
  InputDecoration get dropDownDecoration => InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.white),
          borderRadius: CustomBorderRadius.circular(),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.white),
          borderRadius: CustomBorderRadius.circular(),
        ),
      );
}

extension AssetImageExtension on ImageAssetEnum {
  String getAsset() {
    switch (this) {
      case ImageAssetEnum.sunny:
        return 'assets/images/$name.png';
      case ImageAssetEnum.rainy:
        return 'assets/images/$name.png';
      // ignore: no_default_cases
      default:
        throw Exception('Geçersiz image');
    }
  }
}
