// ignore_for_file: file_names, unused_import, camel_case_types, unused_field, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:flutter_application_1/Responses/Builder_Auth.dart';
import 'dart:async';
import 'dart:convert';

class Builder1 {
  String firstname;
  String lastname;
  String email;
  String userId;
  String password;
  String job_detail;
  String qualification;
  String skills;
  String company_info;
  String website;
  String industry;

  Builder1(
      {this.firstname,
      this.lastname,
      this.email,
      this.password,
      this.userId,
      this.company_info,
      this.industry,
      this.job_detail,
      this.qualification,
      this.skills,
      this.website});
  factory Builder1.fromJson(Map<String, dynamic> json) {
    return Builder1(
        firstname: json['Firstname'],
        lastname: json['Lastname'],
        email: json['email'],
        password: json['password'],
        userId: json['userId'],
        job_detail: json['Jobdetail'],
        qualification: json['Qualification'],
        skills: json['Skills'],
        company_info: json['Companyinfo'],
        website: json['Website'],
        industry: json['Industry']);
  }
}
