import 'package:books_app/app/core/theme/colors.dart';
import 'package:books_app/app/ui/pages/book_detail/widgets/book_detail_view.dart';
import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: _buildAppBar(context),
      body: BookDetailView(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () => print('Show more actions'),
          icon: const Icon(
            Icons.more_vert_outlined,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
