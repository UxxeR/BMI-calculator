import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/app_constants.dart';

class BackgroundBar extends StatelessWidget {
  const BackgroundBar(
      {Key? key, required this.barWidth, required this.barAxisAlignment})
      : super(key: key);
  final double barWidth;
  final MainAxisAlignment barAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: barAxisAlignment,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            color: accentHexColor.withOpacity(0.8),
          ),
        )
      ],
    );
  }
}
