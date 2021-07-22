import 'package:books_app/app/domain/entities/book_entity.dart';
import 'package:books_app/app/ui/widgets/action_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'action_row.dart';

class BookDetailDesktop extends StatelessWidget {
  final Book book;
  final VoidCallback onPressed;

  const BookDetailDesktop({
    Key? key,
    required this.book,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBookImage(size),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                _buildBookTitle(),
                const SizedBox(height: 5),
                _buildBookAuthor(),
                const SizedBox(height: 30),
                _buildActions(),
                const SizedBox(height: 30),
                _buildDescription()
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const ActionButton(icon: Icons.star_border_rounded, isInverted: true),
        const ActionButton(icon: Icons.mode_comment_outlined, isInverted: true),
        const ActionButton(icon: Icons.ios_share, isInverted: true),
      ],
    );
  }

  Widget _buildBookAuthor() {
    return Text(
      book.data.first.author,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 16, color: Colors.grey),
    );
  }

  Widget _buildBookTitle() {
    return Text(
      book.data.first.title,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildBookImage(Size size) {
    if (kIsWeb) {
      return Container(
        margin: const EdgeInsets.all(20),
        height: size.height * 0.33,
        width: size.width * 0.5,
        child: const Placeholder(),
      );
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Image(
          image: NetworkImage(book.data.first.image),
          height: size.height * 0.33,
        ),
      );
    }
  }

  Widget _buildDescription() {
    return Column(
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