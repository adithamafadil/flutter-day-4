import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/datasource/book/book_remote_datasource.dart';
import 'package:flutter_application_1/data/repository/book_repository_impl.dart';
import 'package:flutter_application_1/domain/use_case/book/get_books_use_case.dart';
import 'package:flutter_application_1/presentation/screen/book_screen/controller/book_controller.dart';
import 'package:flutter_application_1/presentation/screen/book_screen/page/book_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: BookPage(
          bookController: BookController(GetBooksUseCase(
              BookRepositoryImpl(BookRemoteDatasource(Dio()))))),
    );
  }
}
