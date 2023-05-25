import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screen/book_screen/controller/book_controller.dart';
import 'package:get/get.dart';

class BookPage extends StatelessWidget {
  final BookController bookController;
  const BookPage({
    super.key,
    required this.bookController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BookController>(
        init: bookController,
        initState: (state) => bookController.getBooks(),
        builder: (controller) {
          if (controller.bookState.value.isSuccess) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: controller.books.length,
              itemBuilder: (context, index) {
                final book = controller.books[index];

                return InkWell(
                  onTap: () {
                    print(book.isbn13);
                  },
                  child: Card(
                    color: Colors.grey.shade300,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Image.network(
                          book.image ?? '',
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                book.title ?? 'Title is Null',
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(book.subtitle ?? ''),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                thickness: 2,
                color: Colors.grey.shade400,
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
