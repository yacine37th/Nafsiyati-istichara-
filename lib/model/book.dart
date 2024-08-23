class BookModel {
  late String? id;
  late String? title;
  late String? authorId;
  late String? authorName;
  late double? ratings;
  late int? reads;
  late String? thumbnail;
  late String? category;
  late String? categoryID;
  late double? price;

  late String? aboutBook;
  late String? publishingHouse;
  late String? url;
  late bool? isCarouselBook = true;
  BookModel({
    required this.id,
    required this.title,
    required this.ratings,
    required this.authorId,
    required this.reads,
    required this.authorName,
    required this.thumbnail,
    required this.category,
    required this.url,
    required this.price,
    required this.aboutBook,
    required this.publishingHouse,
    this.categoryID,
    this.isCarouselBook,
  });
}
