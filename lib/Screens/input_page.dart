import 'package:bmi_calculator_flutter_learning/Components/IconContent.dart';
import 'package:bmi_calculator_flutter_learning/Styles/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter_learning/Components/ReusableCard.dart';
import 'package:flutter/widgets.dart';
import 'package:bmi_calculator_flutter_learning/Styles/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_flutter_learning/Components/RoundedIconButton.dart'; // Import the new widget

import 'package:bmi_calculator_flutter_learning/common.dart';

const bottomContainerHeight = 80.0;

// const bottomContainerColor = Color(0xFFeb1555);
enum Gender {
  male,
  female,
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI CALCULATOR',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0A0D22),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF0A0D22),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          centerTitle: true,
        ),
        textTheme: const TextTheme(bodySmall: TextStyle(color: Colors.white)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InputPage(key: null),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String pageName = 'main';

  Color activeCardColor = const Color(0xFF323359);
  Color inActiveCardColor = const Color(0xFF1D1E33);

  Gender? selectedGender;
  late int height = 10;
  int weight = 0;
  int age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  onPress: () => setState(() {
                    selectedGender = Gender.male;
                  }),
                  color: selectedGender == Gender.male
                      ? activeCardColor
                      : inActiveCardColor,
                  key: null,
                  cardChild: const IconContent(
                    key: null,
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  onPress: () => setState(() {
                    selectedGender = Gender.female;
                  }),
                  color: selectedGender == Gender.female
                      ? activeCardColor
                      : inActiveCardColor,
                  key: null,
                  cardChild: const IconContent(
                    key: null,
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                )),
              ],
            )),
            Expanded(
              child: ReusableCard(
                color: inActiveCardColor,
                key: null,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 16.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x15EB1555),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 10,
                          max: 100,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.toInt();
                              print("height  $newValue");
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kReusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Weight', style: kLabelTextStyle),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Use RoundedIconButton for Decreasing Weight
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight != 0) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            // Use RoundedIconButton for Increasing Weight
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kReusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Age', style: kLabelTextStyle),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Use RoundedIconButton for Decreasing Weight
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (age != 0) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            // Use RoundedIconButton for Increasing Weight
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
            Container(
                color: kBottomContainerColor,
                margin: const EdgeInsets.only(top: 10.0),
                height: bottomContainerHeight,
                width: double.infinity,
                child: const TextButton(
                    onPressed: null,
                    child: Text(
                      'CALCULATE YOUR BMI',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )))
          ],
        ));
  }
}
