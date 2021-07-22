import 'package:books_app/app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ActionsRow extends StatelessWidget {
  final VoidCallback onPressed;

  const ActionsRow({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: buttonBackground,
        borderRadius: BorderRadius.circular(50),
      ),
      child: _buildActionButtons(),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: secondary,
          child: IconButton(
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
            onPressed: onPressed,
          ),
        ),
        const SizedBox(width: 10),
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 21,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: buttonBackground,
            child: IconButton(
              icon: const Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
              onPressed: onPressed,
            ),
          ),
        ),
      ],
    );
  }
}
