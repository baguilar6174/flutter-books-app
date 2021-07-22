import 'package:bloc/bloc.dart';
import 'package:books_app/app/core/errors/failure.dart';
import 'package:books_app/app/domain/entities/book_entity.dart';
import 'package:books_app/app/domain/usecases/get_book.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'booksdetails_state.dart';

class BooksDetailsCubit extends Cubit<BooksDetailsState> {
  
  final GetBook getBook;

  BooksDetailsCubit(this.getBook) : super(BooksDetailsInitial());

  void getNewBook() async {
    emit(BookDetailLoading());
    ImageCache imageCache = ImageCache();
    imageCache.clear();
    final failureOrBook = await getBook();
    emit(_eitherLoadedOrErrorState(failureOrBook));
  }

  BooksDetailsState _eitherLoadedOrErrorState(Either<Failure, Book> failureOrPokemonList) {
    return failureOrPokemonList.fold(
      (failure) => BookDetailError(_mapFailureToMessage(failure)),
      (book) => BookDetaiLoaded(book),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Ha ocurrido un error, por favor intenta nuevamente.';
      default:
        return 'Unexpected error';
    }
  }

}
