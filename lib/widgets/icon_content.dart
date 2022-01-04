import 'package:bmi_calculator/utils/app_constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    Key? key,
    required this.text,
    required this.icon,
    required this.action,
    this.selected = false,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final VoidCallback? action;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: selected ? accentHexColor.withOpacity(0.1) : mainHexColor,
          border: Border.all(
            color: selected ? accentHexColor : accentHexColor.withOpacity(0.4),
            width: 2,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: accentHexColor,
              size: 40,
            ),
            Text(
              text.toUpperCase(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: accentHexColor.withOpacity(0.4),
              ),
            )
          ],
        ),
      ),
    );
  }
}
