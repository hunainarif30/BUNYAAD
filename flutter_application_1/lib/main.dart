// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/interfaces/login.dart';
import 'package:flutter_application_1/interfaces/signup.dart';
import 'package:flutter_application_1/interfaces/browse.dart';
import 'package:flutter_application_1/interfaces/profile.dart';
import 'package:flutter_application_1/providers/builderAddNotifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) {
          return BuilderAddNotifier();
        },
        child: MaterialApp(
          home: Signup(),
        ));
  }
}
