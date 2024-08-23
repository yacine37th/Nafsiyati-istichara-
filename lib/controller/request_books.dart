import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/book.dart';

class RequestedBooksController extends GetxController {
  Map<String, BookModel> requestedBooks = {};

  Future<void> getRequestedBooks() async {
    await FirebaseFirestore.instance
        .collection("books")
        // .orderBy("bookDateAdded", descending: true)
        // .limit(9)
        .get()
        .then((value) {
      if (value.docs.isEmpty) {
        print("*******dddddd***********");
      }
      for (int index = 0; index < value.docs.length; index++) {
        requestedBooks.addAll({
          value.docs[index].id: BookModel(
              id: value.docs[index].id,
              authorName: value.docs[index]["bookAuthorName"],
              authorId: value.docs[index]["bookAuthorID"],
              ratings: value.docs[index]["bookRatings"].toDouble(),
              reads: value.docs[index]["bookReads"],
              title: value.docs[index]["bookTitle"],
              category: value.docs[index]["bookCategory"],
              thumbnail: value.docs[index]["bookThumnail"],
              aboutBook: value.docs[index]["bookAbout"],
              url: value.docs[index]["bookURL"],
              publishingHouse: value.docs[index]["bookPublishingHouse"],
              price: value.docs[index]["bookPrice"].toDouble())
        });
      }
      print("AppBarType.mostRecentBooks");
    });

    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getRequestedBooks();
    super.onInit();
  }
}
