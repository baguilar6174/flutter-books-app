import 'package:books_app/app/core/errors/exceptions.dart';
import 'package:books_app/app/data/models/book_model.dart';
import 'package:http/http.dart' as http;


abstract class BooksRemoteDatasource {

  Future<BookModel> requestBook();

}

class BooksRemoteDatasourceImpl implements BooksRemoteDatasource {
  
  final http.Client client;

  BooksRemoteDatasourceImpl(this.client);

  @override
  Future<BookModel> requestBook() async {
    
    const String url = 'https://fakerapi.it/api/v1/books?_quantity=5';
    final uri = Uri.parse(url);
    final response = await client.get(uri);

    if(response.statusCode == 200){
      return bookModelFromJson(response.body);
    } else {
      throw ServerException();
    }

  }

}