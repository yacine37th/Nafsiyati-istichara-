import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/book.dart';

class RequestedBooksController extends GetxController {
  Map<String, BookModel> requestedBooks = {
    // "1": BookModel(id: '&', title: "كتاب 1", url: "assets/books/book1.pdf"),
    // "2": BookModel(id: '&', title: "كتاب 2", url: "assets/books/book2.pdf"),
    // "3": BookModel(id: '&', title: "كتاب 3", url: "assets/books/book3.pdf"),
    // "4": BookModel(id: '&', title: "كتاب 4", url: "assets/books/book4.pdf"),
    // "5": BookModel(id: '&', title: "كتاب 5", url: "assets/books/book5.pdf"),
    // "6": BookModel(id: '&', title: "كتاب 6", url: "assets/books/book6.pdf"),
    // "7": BookModel(id: '&', title: "كتاب 7", url: "assets/books/book7.pdf"),
    // "8": BookModel(id: '&', title: "كتاب 8", url: "assets/books/book8.pdf"),
    // "9": BookModel(id: '&', title: "كتاب 9", url: "assets/books/book9.pdf"),
    // "10": BookModel(id: '&', title: "كتاب 10", url: "assets/books/book10.pdf"),
  };

  Future<void> getRequestedBooks() async {
    await FirebaseFirestore.instance
        .collection("books")
        .orderBy("bookDateAdded", descending: true)
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
            // authorName: value.docs[index]["bookAuthorName"],
            // authorId: value.docs[index]["bookAuthorID"],
            // ratings: value.docs[index]["bookRatings"].toDouble(),
            // reads: value.docs[index]["bookReads"],
            imageUrl: value.docs[index]["bookImageUrl"],
            // category: value.docs[index]["bookCategory"],
            // thumbnail: value.docs[index]["bookThumnail"],
            // aboutBook: value.docs[index]["bookAbout"],
            url: value.docs[index]["bookLink"],
            // publishingHouse: value.docs[index]["bookPublishingHouse"],
            // price: value.docs[index]["bookPrice"].toDouble()
          )
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
