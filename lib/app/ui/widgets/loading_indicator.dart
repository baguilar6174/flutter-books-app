import 'package:books_app/app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: CircularProgressIndicator(
          color: secondary,
        ),
      ),
    );
  }
}