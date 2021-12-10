// ignore_for_file: camel_case_types, non_constant_identifier_names, unused_field, unused_import, file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/interfaces/browse.dart';
import 'package:flutter_application_1/interfaces/FavBuilder.dart';

class FavBuilderNotifier extends ChangeNotifier {
  List<FavBuilder> FavBuilderList = [];

  addFavBuilder(String name, String image, int rating, String comp_name) async {
    FavBuilder build = FavBuilder(
        name: name, image: image, rating: rating, comp_name: comp_name);
    FavBuilderList.add(build);
    notifyListeners();
  }

  removeFavBuilder(index) {
    FavBuilderList.removeWhere(
        (element) => element.name == FavBuilderList[index].name);
    notifyListeners();
  }
}
