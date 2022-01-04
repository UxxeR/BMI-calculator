import 'package:bmi_calculator/logic/bmi.dart';
import 'package:bmi_calculator/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          child: Text(
            AppLocalizations.of(context).back.toUpperCase(),
            style: const TextStyle(
              fontSize: 30,
              color: mainHexColor,
            ),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(accentHexColor)),
        ),
      ),
      backgroundColor: mainHexColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              bmi.calculateBMI().toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 90,
                color: accentHexColor,
              ),
              textAlign: TextAlign.center,
            ),
            const Divider(
              color: accentHexColor,
              height: 20,
              indent: 40,
              endIndent: 40,
            ),
            Text(
              bmi.getInterpretation(context),
              style: const TextStyle(
                fontSize: 42,
                color: accentHexColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
