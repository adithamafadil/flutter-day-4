import 'package:flutter_application_1/data/model/book_model.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks();
}
