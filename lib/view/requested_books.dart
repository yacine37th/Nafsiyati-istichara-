import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/request_books.dart';
import '../theme/colors.dart';
import '../theme/main_colors.dart';
import 'widgets.dart';

class RequestedBooks extends StatelessWidget {
  const RequestedBooks({super.key});

  @override
  Widget build(BuildContext context) {
    final RequestedBooksController requestedBooksController = Get.find();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              navigator!.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            )),
        elevation: 0,
        backgroundColor: AppColors.greenColor,
        iconTheme: const IconThemeData(color: Colors.white),
        bottom: PreferredSize(
            preferredSize: const Size(0, 0),
            child: Container(
              color: AppColors.greenColor,
              height: 1,
            )),
      ),
      backgroundColor: Colors.white,
      //   body: GetBuilder<RequestedBooksController>(builder: (context) {
      //     if (requestedBooksController.requestedBooks.isEmpty) {
      //       return const Center(
      //         child: Text("لا يوجد كتب"),
      //       );
      //     } else {
      //       return ListView(
      //         physics: const BouncingScrollPhysics(),
      //         // controller: requestedBooksController.scrollController,
      //         children: [
      //           GridView.builder(
      //             physics: const NeverScrollableScrollPhysics(),
      //             padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      //             shrinkWrap: true,
      //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 3,
      //                 crossAxisSpacing: 12,
      //                 mainAxisSpacing: 12,
      //                 childAspectRatio: 0.77),
      //             itemCount: requestedBooksController.requestedBooks.length,
      //             itemBuilder: (context, index) {
      //               return InkWell(
      //                 onTap: () {
      //                   Get.toNamed("/BookDetails",
      //                       arguments: requestedBooksController
      //                           .requestedBooks.values
      //                           .elementAt(index));
      //                 },
      //                 // child: BookThumnail(
      //                 //     url: requestedBooksController.requestedBooks.values
      //                 //         .elementAt(index)
      //                 //         .thumbnail!),
      //               );
      //             },
      //           ),
      //           // Builder(
      //           //   builder: (context) {
      //           //     if (requestedBooksController.isFetching) {
      //           //       return Column(
      //           //         children: const [
      //           //           SizedBox(height: 60),
      //           //           Center(child: CircularProgressIndicator()),
      //           //           SizedBox(height: 60)
      //           //         ],
      //           //       );
      //           //     } else {
      //           //       return const SizedBox();
      //           //     }
      //           //   },
      //           // )
      //         ],
      //       );
      //     }
      //   }),
      // );
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                GetBuilder<RequestedBooksController>(builder: (context) {
                  return GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    itemCount: requestedBooksController.requestedBooks.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      childAspectRatio:
                          0.7, // Adjust this for book thumbnail aspect ratio
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Get.toNamed("/BookContent",
                                arguments: requestedBooksController
                                    .requestedBooks.values
                                    .elementAt(index));
                          },
                          child:Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                border: Border.all(color: greyColor)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  requestedBooksController.requestedBooks.values
                                      .elementAt(index)
                                      .imageUrl!,
                                  fit: BoxFit.cover,
                                )),
                          )
                          // Center(
                          //   child: Text(requestedBooksController
                          //       .requestedBooks.values
                          //       .elementAt(index)
                          //       .title!),
                          // )

                          );
                    },
                  );
                }),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class ReqBooksAppBarTitle extends StatelessWidget {
//   const ReqBooksAppBarTitle(
//       {super.key, required this.appBarType, this.categoryName});
//   final AppBarType appBarType;
//   final String? categoryName;

//   @override
//   Widget build(BuildContext context) {
//     if (appBarType == AppBarType.categoryBooks) {
//       return Text(categoryName!);
//     } else if (appBarType == AppBarType.favoriteBooks) {
//       return const Text("كتبي المفضلة");
//     } else if (appBarType == AppBarType.mostRecentBooks) {
//       return const Text("أحدث الكتب");
//     } else if (appBarType == AppBarType.topRatedBooks) {
//       return const Text("الأكثر تقييما");
//     } else if (appBarType == AppBarType. maktabati) {
//       return const Text("مكتبتي");
//     } else {
//       return Text(categoryName!);
//     }
//   }
// }
