import 'package:books_app/app/core/errors/failure.dart';
import 'package:books_app/app/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BooksRepository {

  Future<Either<Failure, Book>> getBook();

}