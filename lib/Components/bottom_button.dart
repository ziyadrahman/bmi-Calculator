import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter_learning/Styles/Constants.dart';
import 'package:bmi_calculator_flutter_learning/Styles/color.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onTap;

  const BottomButton({
    super.key,
    required this.buttonTitle, // Receive button title as parameter
    required this.onTap, // Receive onTap function as parameter
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Calls the onTap function when the button is pressed
      child: Container(
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        height: kbottomContainerHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            buttonTitle, // Display the button title passed as a parameter
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
