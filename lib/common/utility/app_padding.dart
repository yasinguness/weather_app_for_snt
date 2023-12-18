import 'package:flutter/material.dart';

class CustomPadding extends EdgeInsets {
  const CustomPadding.symnetric({double? vertical, double? horizontal})
      : super.symmetric(vertical: vertical ?? 8, horizontal: horizontal ?? 8);
}

class CustomBorderRadius extends BorderRadius {
  CustomBorderRadius.circular([double? radius]) : super.circular(radius ?? 12);
}
