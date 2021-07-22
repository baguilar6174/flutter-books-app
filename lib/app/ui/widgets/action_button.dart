import 'package:books_app/app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final bool isInverted;

  const ActionButton({
    Key? key,
    required this.icon,
    this.isInverted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: isInverted ? secondary : Colors.white,
      ),
      child: Icon(icon, color: isInverted ? Colors.white : secondary),
    );
  }
}