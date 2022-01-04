import 'package:bmi_calculator/utils/app_constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.controller,
    required this.onUpdated,
    required this.maxLength,
    required this.onSubmitted,
    this.suffix = "",
    this.label = "",
  }) : super(key: key);
  final TextEditingController controller;
  final Function(String)? onSubmitted;
  final Function(String)? onUpdated;
  final String suffix;
  final String label;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: accentHexColor.withOpacity(0.05),
        border: Border.all(
          color: accentHexColor.withOpacity(0.4),
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: accentHexColor.withOpacity(0.4),
            ),
          ),
          SizedBox(
            width: 130,
            child: TextField(
              controller: controller,
              onSubmitted: onSubmitted,
              onChanged: onUpdated,
              style: const TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w300,
                color: accentHexColor,
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                border: InputBorder.none,
                counterText: "",
                hintText: "0",
                hintStyle: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w300,
                  color: accentHexColor.withOpacity(0.4),
                ),
              ),
              maxLength: maxLength,
            ),
          ),
          Visibility(
            visible: suffix.isNotEmpty,
            child: Text(
              suffix.toUpperCase(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: accentHexColor.withOpacity(0.4),
              ),
            ),
          )
        ],
      ),
    );
  }
}
