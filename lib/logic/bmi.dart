import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BMI {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmi = 0;
  String _textResult = "";

  BMI(TextEditingController heightController,
      TextEditingController weightController) {
    _heightController = heightController;
    _weightController = weightController;
  }

  double calculateBMI() {
    double _height = double.parse(_heightController.text);
    double _weight = double.parse(_weightController.text);
    _bmi = _weight / math.pow(_height / 100, 2);

    return _bmi;
  }

  String getInterpretation(BuildContext context) {
    if (_bmi >= 30) {
      _textResult = AppLocalizations.of(context).obeseWeight;
    } else if (_bmi >= 25) {
      _textResult = AppLocalizations.of(context).overWeight;
    } else if (_bmi >= 18.5) {
      _textResult = AppLocalizations.of(context).normalWeight;
    } else {
      _textResult = AppLocalizations.of(context).underWeight;
    }

    return _textResult;
  }

  bool checkIfCanCalculateBMI() {
    bool _canCalculate =
        _heightController.text.isNotEmpty && _weightController.text.isNotEmpty;
    return _canCalculate;
  }

  void formatValidNumber() {
    _heightController.text = _heightController.text.replaceAll(",", ".");
    _weightController.text = _weightController.text.replaceAll(",", ".");
  }
}
