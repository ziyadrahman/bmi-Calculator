import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    required this.color,
    this.cardChild,
    this.onPress,
  });

  final Color color;
  final Widget? cardChild;
  final VoidCallback? onPress;
  final String pageName = 'ReusableCard';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: color,
        ),
        child: cardChild,
      ),
    );
  }
}
