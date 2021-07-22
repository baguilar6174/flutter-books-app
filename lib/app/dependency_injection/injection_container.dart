import 'package:books_app/app/data/datasources/network/book_datasource.dart';
import 'package:books_app/app/data/repositories_impl/book_repository_impl.dart';
import 'package:books_app/app/domain/repositories/books_repository.dart';
import 'package:books_app/app/domain/usecases/get_book.dart';
import 'package:books_app/app/ui/cubit/books_details/booksdetails_cubit.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  await initBookDetail();
}

Future<void> initBookDetail() async {
  //! Features - BookDetail
  // Cubit
  sl.registerFactory(() => BooksDetailsCubit(sl()));

  // use cases
  sl.registerLazySingleton(() => GetBook(sl()));

  // Repository
  sl.registerLazySingleton<BooksRepository>(() => BookRepositoryImpl(sl()));

  // Data sources
  sl.registerLazySingleton<BooksRemoteDatasource>(() => BooksRemoteDatasourceImpl(sl()));

  // External
  sl.registerLazySingleton(() => http.Client());
}