import 'package:books_app/app/core/errors/exceptions.dart';
import 'package:books_app/app/data/datasources/network/book_datasource.dart';
import 'package:books_app/app/domain/entities/book_entity.dart';
import 'package:books_app/app/core/errors/failure.dart';
import 'package:books_app/app/domain/repositories/books_repository.dart';
import 'package:dartz/dartz.dart';

class BookRepositoryImpl implements BooksRepository {
  
  final BooksRemoteDatasource remoteDatasource;

  BookRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<Failure, Book>> getBook() async {
    
    try {
      final book = await remoteDatasource.requestBook();
      return Right(book);
    } on ServerException {
      return Left(ServerFailure(message: 'Ha ocurrido un error al obtener los datos del servidor'));
    }
  }

}