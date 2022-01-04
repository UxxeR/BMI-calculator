import 'package:bmi_calculator/logic/bmi.dart';
import 'package:bmi_calculator/pages/result.dart';
import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:bmi_calculator/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/app_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  late BMI _bmi;
  late bool activated;
  Gender genderSelected = Gender.male;

  @override
  void initState() {
    _heightController.text = 180.toString();
    _weightController.text = 70.toString();
    _ageController.text = 25.toString();
    _bmi = BMI(_heightController, _weightController);
    activated = _bmi.checkIfCanCalculateBMI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 80,
        child: ElevatedButton(
          onPressed: activated
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(bmi: _bmi),
                    ),
                  );
                }
              : null,
          child: const Text(
            "CALCULATE",
            style: TextStyle(
              fontSize: 30,
              color: mainHexColor,
            ),
          ),
          style: ButtonStyle(
              backgroundColor: _bmi.checkIfCanCalculateBMI()
                  ? MaterialStateProperty.all(accentHexColor)
                  : MaterialStateProperty.all(Colors.grey.withOpacity(0.4))),
        ),
      ),
      backgroundColor: mainHexColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: genderSelected == Gender.male ? 4 : 3,
                  child: IconContent(
                    text: "Male",
                    icon: Icons.male_rounded,
                    action: () {
                      setState(() {
                        genderSelected = Gender.male;
                      });
                    },
                    selected: genderSelected == Gender.male,
                  ),
                ),
                Expanded(
                  flex: genderSelected == Gender.female ? 4 : 3,
                  child: IconContent(
                    text: "Female",
                    icon: Icons.female_rounded,
                    action: () {
                      setState(() {
                        genderSelected = Gender.female;
                      });
                    },
                    selected: genderSelected == Gender.female,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: accentHexColor,
            height: 10,
            indent: 80,
            endIndent: 80,
          ),
          Expanded(
            flex: 0,
            child: InputField(
              controller: _ageController,
              onUpdated: (value) {
                setState(() {});
              },
              maxLength: 3,
              label: "Age",
              onSubmitted: (value) {},
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: InputField(
                    controller: _heightController,
                    onUpdated: (value) {
                      setState(() {
                        activated = _bmi.checkIfCanCalculateBMI();
                      });
                    },
                    suffix: "cm",
                    label: "Height",
                    onSubmitted: (value) {
                      setState(() {
                        _bmi.formatValidNumber();
                      });
                    },
                    maxLength: 3,
                  ),
                ),
                Expanded(
                  child: InputField(
                    controller: _weightController,
                    onUpdated: (value) {
                      setState(() {
                        activated = _bmi.checkIfCanCalculateBMI();
                      });
                    },
                    suffix: "kg",
                    label: "Weight",
                    onSubmitted: (value) {
                      setState(() {
                        _bmi.formatValidNumber();
                      });
                    },
                    maxLength: 5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
