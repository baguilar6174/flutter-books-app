import 'package:books_app/app/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'action_row.dart';

class BottomCard extends StatelessWidget {
  const BottomCard({
    Key? key,
    required this.onPressed,
    required this.book,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 8.0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildDescriptionHeader(),
              const SizedBox(height: 20),
              Text(
                book.data.first.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildDescriptionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Descripción',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        ActionsRow(onPressed: onPressed),
      ],
    );
  }
}