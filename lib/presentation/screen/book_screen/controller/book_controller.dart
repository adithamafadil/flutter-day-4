import 'package:flutter_application_1/data/model/book_model.dart';
import 'package:flutter_application_1/domain/use_case/book/get_books_use_case.dart';
import 'package:flutter_application_1/presentation/state/data_state.dart';
import 'package:get/get.dart';

class BookController extends GetxController {
  final GetBooksUseCase _getBooksUseCase;

  BookController(this._getBooksUseCase);

  RxList<Book> books = <Book>[].obs;
  Rx<DataState> bookState = Rx(DataState.inital);

  void getBooks() async {
    bookState(DataState.loading);
    update();

    final result = await _getBooksUseCase.call();
    books(result);
    bookState(DataState.success);
    update();
  }
}
