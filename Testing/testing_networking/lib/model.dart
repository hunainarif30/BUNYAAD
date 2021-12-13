// ignore_for_file: camel_case_types, unused_import

import 'package:flutter/material.dart';

class photo_album {
  final int userId;
  final int id;
  final String title;

  photo_album({
    required this.userId,
    required this.id,
    required this.title,
  });
  factory photo_album.fromJson(Map<String, dynamic> json) {
    return photo_album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
