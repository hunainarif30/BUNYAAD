// ignore_for_file: file_names, unused_import, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_application_1/models/BuilderSignup.dart';

import 'package:http/http.dart' as http;

Future<Builder_Signup_Info> createBuilder_Auth(
    String firstname, String lastname, String email, String password) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 201) {
    return Builder_Signup_Info.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}
