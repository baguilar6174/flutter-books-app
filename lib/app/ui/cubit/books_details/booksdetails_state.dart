part of 'booksdetails_cubit.dart';

abstract class BooksDetailsState extends Equatable {
  const BooksDetailsState();

  @override
  List<Object> get props => [];
}

class BooksDetailsInitial extends BooksDetailsState {}

class BookDetailLoading extends BooksDetailsState {}

class BookDetaiLoaded extends BooksDetailsState {
  final Book book;

  const BookDetaiLoaded(this.book);

  @override
  List<Object> get props => [book];
}

class BookDetailError extends BooksDetailsState {
  
  final String message;

  const BookDetailError(this.message);

  @override
  List<Object> get props => [message];
}
