import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/model/book_model.dart';

class BookRemoteDatasource {
  final Dio _client;

  const BookRemoteDatasource(this._client);

  Future<BookResponse?> getBooks() async {
    try {
      final result = await _client.get('https://api.itbook.store/1.0/new');

      if (result.statusCode == 200) {
        return BookResponse.fromJson(result.data);
      }

      return null;
    } catch (e, stacktrace) {
      log('Error on BookRemoteDatasource ${e.toString()}: $stacktrace');
      return null;
    }
  }
}
