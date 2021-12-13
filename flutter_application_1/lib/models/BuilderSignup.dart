// ignore_for_file: file_names, unused_import, camel_case_types, unused_field

import 'package:flutter/material.dart';

import 'package:flutter_application_1/Responses/Builder_Auth.dart';
import 'dart:async';
import 'dart:convert';

class Builder_Signup_Info {
  final String firstname;
  final String lastname;
  final String email;
  final String password;

  Builder_Signup_Info({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
  });
  factory Builder_Signup_Info.fromJson(Map<String, dynamic> json) {
    return Builder_Signup_Info(
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      password: json['password'],
    );
  }
}
