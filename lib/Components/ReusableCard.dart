import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  const ReusableCard({super.key, required this.cardChild, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: color,
      ),
      child: cardChild,
    );
  }
}
