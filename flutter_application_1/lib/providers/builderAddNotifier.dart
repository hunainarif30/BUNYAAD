// ignore_for_file: camel_case_types, non_constant_identifier_names, unused_field, unused_import, file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/interfaces/browse.dart';
import 'package:flutter_application_1/interfaces/builders.dart';

class BuilderAddNotifier extends ChangeNotifier {
  List<Builders> builderList = [];

  addBuilder(String FirstName) async {
    Builders build = Builders(FirstName);
    builderList.add(build);
    notifyListeners();
  }
}
