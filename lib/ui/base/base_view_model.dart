import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool isLdg) {
    _isLoading = isLdg;
    notifyListeners();
  }

  // ignore: avoid_positional_boolean_parameters
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
