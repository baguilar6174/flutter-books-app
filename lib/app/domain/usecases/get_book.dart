import 'package:books_app/app/core/errors/failure.dart';
import 'package:books_app/app/domain/entities/book_entity.dart';
import 'package:books_app/app/domain/repositories/books_repository.dart';
import 'package:dartz/dartz.dart';

class GetBook {
  
  final BooksRepository booksRepository;

  GetBook(this.booksRepository);

  Future<Either<Failure, Book>> call() async {
    return booksRepository.getBook();
  }

}