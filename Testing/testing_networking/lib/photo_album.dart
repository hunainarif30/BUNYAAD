// ignore_for_file: camel_case_types, unused_import, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testing_networking/model.dart';

Future<photo_album> fetchphoto_album() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    return photo_album.fromJson((jsonDecode(response.body)));
  } else {
    throw Exception(' Failed to Get data');
  }
}
