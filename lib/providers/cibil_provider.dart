import 'package:flutter/material.dart';

class CibilProvider extends ChangeNotifier {
  int? _cibilScore;
  bool _isLoading = false;

  int? get cibilScore => _cibilScore;
  bool get isLoading => _isLoading;

  void checkCibil(String panNumber) async {
    _isLoading = true;
    _cibilScore = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2)); // Simulating API call

    if (panNumber.isNotEmpty && panNumber.length == 10) {
      _cibilScore = 750; // Mock score
    } else {
      _cibilScore = null;
    }
    _isLoading = false;
    notifyListeners();
  }
}