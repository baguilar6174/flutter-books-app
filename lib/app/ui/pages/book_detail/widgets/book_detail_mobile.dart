import 'package:books_app/app/domain/entities/book_entity.dart';
import 'package:books_app/app/ui/widgets/action_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'bottom_card.dart';

class BookDetailMobile extends StatelessWidget {
  final Book book;
  final VoidCallback onPressed;

  const BookDetailMobile({
    Key? key,
    required this.book,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildBookImage(size),
        const SizedBox(height: 20),
        _buildBookTitle(),
        const SizedBox(height: 5),
        _buildBookAuthor(),
        const SizedBox(height: 30),
        _buildActions(),
        const SizedBox(height: 30),
        BottomCard(onPressed: onPressed, book: book),
      ],
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const ActionButton(icon: Icons.star_border_rounded),
        const ActionButton(icon: Icons.mode_comment_outlined),
        const ActionButton(icon: Icons.ios_share),
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
      return Image(
        image: NetworkImage(book.data.first.image),
        height: size.height * 0.33,
      );
    }
  }
}