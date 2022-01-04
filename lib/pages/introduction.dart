import 'package:bmi_calculator/pages/home.dart';
import 'package:bmi_calculator/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        showNextButton: false,
        globalBackgroundColor: mainHexColor,
        pages: [
          PageViewModel(
            title: AppLocalizations.of(context).howWorksTitle.toUpperCase(),
            image: Center(child: Image.asset("assets/icon/icon.png")),
            body: AppLocalizations.of(context).howWorksBody,
            decoration: const PageDecoration(
              pageColor: mainHexColor,
              titleTextStyle: TextStyle(
                fontSize: 30,
                color: accentHexColor,
              ),
              bodyTextStyle: TextStyle(
                fontSize: 15,
                color: accentHexColor,
              ),
            ),
          ),
          PageViewModel(
            title: AppLocalizations.of(context).howCalculateTitle.toUpperCase(),
            image: Image.asset("assets/icon/icon.png"),
            body: AppLocalizations.of(context).howCalculateBody,
            decoration: const PageDecoration(
              pageColor: mainHexColor,
              titleTextStyle: TextStyle(
                fontSize: 30,
                color: accentHexColor,
              ),
              bodyTextStyle: TextStyle(
                fontSize: 15,
                color: accentHexColor,
              ),
            ),
          ),
        ],
        done: const Icon(
          Icons.check_rounded,
          color: accentHexColor,
        ),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: accentHexColor,
          color: accentHexColor,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
        showSkipButton: true,
        skip: const Icon(
          Icons.skip_next_rounded,
          color: accentHexColor,
        ),
        onDone: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        },
      ),
    );
  }
}
