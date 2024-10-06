import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';

import '../controller/book_content.dart';
import '../theme/main_colors.dart';


class BookContent extends StatelessWidget {
  const BookContent({super.key});

  @override
  Widget build(BuildContext context) {
    BookContentController bookContentController = Get.find();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
          backgroundColor: AppColors.greenColor,
        leading: IconButton(
            onPressed: () {
              navigator!.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            )),
      ),
      body: PDF(
              pageSnap: false,
              pageFling: false,
              swipeHorizontal: false,
              autoSpacing: false,
              onPageChanged: (page, total) {
                print(page);
              },
              nightMode: false)
          .fromUrl(bookContentController.book.url!),
    );
  }
}
