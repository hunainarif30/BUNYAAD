// ignore_for_file: unused_import, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, dead_code, deprecated_member_use, empty_constructor_bodies, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_application_1/interfaces/login.dart';

class Intro_page extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  const Intro_page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(('images/intro.jpg')), fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 7.0),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 4.0, color: Colors.black),
                      bottom: BorderSide(width: 4.0, color: Colors.black),
                      left: BorderSide(width: 4.0, color: Colors.black),
                      right: BorderSide(width: 4.0, color: Colors.black),
                    ),
                    // color: Colors.white,
                  ),
                  child: TextButton.icon(
                    //  borderSide: BorderSide(color: Colors.black87),

                    //shape: RoundedRectangleBorder(
                    //  borderRadius: BorderRadius.circular(1.0)),
                    // color: Colors.blueGrey[300],
                    label: Icon(Icons.construction_sharp),
                    icon: Text('USE AS A BUILDER',
                        style: TextStyle(
                          fontSize: 25.0,
                          //   fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Oswald',
                          letterSpacing: 1.2,
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => login(),
                          ));
                    },
                  ),
                ),
                SizedBox(height: 40.0),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 7.0),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 4.0, color: Colors.black),
                      bottom: BorderSide(width: 4.0, color: Colors.black),
                      left: BorderSide(width: 4.0, color: Colors.black),
                      right: BorderSide(width: 4.0, color: Colors.black),
                    ),
                  ),
                  child: TextButton.icon(
                    label: Icon(Icons.account_box_sharp),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => login(),
                          ));
                    },
                    icon: Text(
                      'USE AS A CUSTOMER',
                      style: TextStyle(
                        letterSpacing: 1.2,
                        fontSize: 25.0,
                        color: Colors.white,
                        fontFamily: 'Oswald',
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
