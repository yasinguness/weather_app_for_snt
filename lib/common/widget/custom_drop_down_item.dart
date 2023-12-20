import 'package:flutter/material.dart';

class CustomDropDown<T> extends DropdownMenuItem<T> {
  CustomDropDown({
    required T value,
    required BuildContext context,
    required String childText,
    super.key,
  }) : super(
          value: value,
          child: Text(
            childText,
            style: Theme.of(context).textTheme.bodySmall,
          ), // 'child' öğesini Text widget'ı olarak belirtiyoruz
        );
}
