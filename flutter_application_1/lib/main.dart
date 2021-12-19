// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/builder_controller.dart';
import 'package:flutter_application_1/Responses/Builder_Auth.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/interfaces/edit_builder_profile.dart';
import 'package:flutter_application_1/interfaces/intro_page.dart';
import 'package:flutter_application_1/interfaces/login.dart';
import 'package:flutter_application_1/interfaces/profile.dart';
import 'package:flutter_application_1/interfaces/signup.dart';
import 'package:flutter_application_1/interfaces/browse.dart';
import 'package:flutter_application_1/interfaces/edit_profile.dart';
import 'package:flutter_application_1/interfaces/chat.dart';

//import 'package:flutter_application_1/interfaces/splash_screen.dart';
import 'package:flutter_application_1/providers/builderAddNotifier.dart';
import 'package:flutter_application_1/providers/favBuilderNotifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavBuilderNotifier()),
        ChangeNotifierProvider(create: (_) => BuilderLoginSignupController()),
        ChangeNotifierProvider(create: (_) => Builder_Controller()),
      ],
      child: const HomeApp(),
    ),
  );
}

class HomeApp extends StatelessWidget {
  const HomeApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Intro_page(),
    );
  }
}
