import 'package:books_app/app/dependency_injection/injection_container.dart';
import 'package:books_app/app/domain/entities/book_entity.dart';
import 'package:books_app/app/ui/cubit/books_details/booksdetails_cubit.dart';
import 'package:books_app/app/ui/widgets/error_message.dart';
import 'package:books_app/app/ui/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'book_detail_desktop.dart';
import 'book_detail_mobile.dart';

class BookDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (_) => sl<BooksDetailsCubit>(),
      child: BlocBuilder<BooksDetailsCubit, BooksDetailsState>(
        builder: (context, state) {
          return _buildContentFromState(context, state, size);
        },
      ),
    );
  }

  Widget _buildContentFromState(
    BuildContext context,
    BooksDetailsState state,
    Size size,
  ) {
    if (state is BooksDetailsInitial) {
      _getRandomBook(context);
      return LoadingIndicator();
    } else if (state is BookDetailLoading) {
      return LoadingIndicator();
    } else if (state is BookDetaiLoaded) {
      final book = state.book;
      return ScreenTypeLayout(
        mobile: BookDetailMobile(
          book: book,
          onPressed: () => _getRandomBook(context, book: book),
        ),
        desktop: BookDetailDesktop(
          book: book,
          onPressed: () => _getRandomBook(context, book: book),
        ),
        tablet: BookDetailDesktop(
          book: book,
          onPressed: () => _getRandomBook(context, book: book),
        ),
      );
    } else if (state is BookDetailError) {
      return ErrorMessage(
        message: state.message,
        onPressed: () => _getRandomBook(context),
      );
    } else {
      return Container(
        child:  const Center(
          child: Text('Error'),
        ),
      );
    }
  }

  void _getRandomBook(BuildContext context, {Book? book}) async {
    if (book != null) {
      await evictImage(book.data.first.image);
    }

    final bookDetailCubit = context.read<BooksDetailsCubit>();
    bookDetailCubit.getNewBook();
  }

  Future<void> evictImage(String imageURL) async {
    final NetworkImage provider = NetworkImage(imageURL);
    await provider.evict();
  }
}