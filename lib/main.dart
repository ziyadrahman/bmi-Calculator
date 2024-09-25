import 'package:bmi_calculator_flutter_learning/Components/IconContent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter_learning/Components/ReusableCard.dart';
import 'package:flutter/widgets.dart';
import 'package:bmi_calculator_flutter_learning/Styles/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'common.dart';

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
      home: const MyHomePage(title: 'BMI CALCULATOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String pageName = 'main';

  Color activeCardColor = const Color(0xFF323359);
  Color inActiveCardColor = const Color(0xFF1D1E33);

  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
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
                  cardChild: IconContent(
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
              ),
            ),
            const Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  color: reusableCardColor,
                  key: null,
                )),
                Expanded(
                    child: ReusableCard(
                  color: reusableCardColor,
                  key: null,
                )),
              ],
            )),
            Container(
                color: bottomContainerColor,
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
