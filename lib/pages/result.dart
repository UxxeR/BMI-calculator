import 'package:bmi_calculator/logic/bmi.dart';
import 'package:bmi_calculator/utils/app_constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.bmi}) : super(key: key);
  final BMI bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 80,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "BACK",
            style: TextStyle(
              fontSize: 30,
              color: mainHexColor,
            ),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(accentHexColor)),
        ),
      ),
      backgroundColor: mainHexColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: SizedBox(),
          ),
          Expanded(
            child: Text(
              bmi.calculateBMI().toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 90,
                color: accentHexColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Text(
              bmi.getInterpretation(),
              style: const TextStyle(
                fontSize: 42,
                color: accentHexColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
