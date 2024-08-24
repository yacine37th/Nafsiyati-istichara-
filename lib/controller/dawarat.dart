import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../functions/functions.dart';
import '../model/formation.dart';

class DawaratController extends GetxController {

 Map<String, FormationModel> formations = {};
  bool isDate = false;
  DateTime now = DateTime.now();
  Future<void> getFormations() async {
    await FirebaseFirestore.instance
        .collection("formations")
        .orderBy("formationDateAdded", descending: true)
        .snapshots(includeMetadataChanges: true)
        .listen((value) async {
      for (int index = 0; index < value.docs.length; index++) {
        formations.addAll({
          value.docs[index].id: FormationModel(
            id: value.docs[index].id,
            description: value.docs[index]["formationText"],
            date: MainFunctions.dateFormat.format(DateTime.parse(
                value.docs[index]["formationDate"].toDate().toString())),
            addedDate: MainFunctions.dateFormat.format(DateTime.parse(
                value.docs[index]["formationDateAdded"].toDate().toString())),
            link: value.docs[index]["formationLink"],
            pictureUrl: value.docs[index]["formationPicUrl"],
          )
        });

        update();
      }
      print("value.date***********");

      formations.forEach((key, value) {
        print(value.date);
      });
    });
    formations.forEach((key, value) {
      print(value.date);
    });
    update();
  }

  Future<void> launchUrl2(String link) async {
    final Uri _url = Uri.parse(link);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getFormations();
    super.onInit();
  }
}