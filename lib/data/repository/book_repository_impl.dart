import 'dart:developer';

import 'package:flutter_application_1/data/datasource/book/book_remote_datasource.dart';
import 'package:flutter_application_1/data/model/book_model.dart';
import 'package:flutter_application_1/domain/repository/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDatasource _remoteDatasource;

  const BookRepositoryImpl(this._remoteDatasource);

  @override
  Future<List<Book>> getBooks() async {
    try {
      final result = await _remoteDatasource.getBooks();

      if (result != null && result.books != null) {
        return result.books!;
      }

      return [];
    } catch (e, stacktrace) {
      log('Error on BookRepositoryImpl ${e.toString()}: $stacktrace');
      return [];
    }
  }
}
