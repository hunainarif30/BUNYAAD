// ignore_for_file: unused_import, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, dead_code

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/interfaces/login.dart';
import 'package:flutter_application_1/interfaces/signup.dart';
import 'package:flutter_application_1/providers/builderAddNotifier.dart';
import 'package:flutter_application_1/interfaces/builders.dart';
import 'package:provider/provider.dart';

class Browse extends StatelessWidget {
  const Browse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            SizedBox(height: 200.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 180.0,
                  color: kPrimaryColor,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'My Contractors',
                        style: TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF),
                          fontFamily: 'Billabong',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 40.0,
                          child: TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              labelText: 'Search..',
                              labelStyle: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Mont',
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.search),
                                onPressed: () {
                                  // builder profile
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: [
                Consumer<BuilderAddNotifier>(
                    builder: (context, builderAddNotifier, _) {
                  return ListView.builder(
                    itemCount: builderAddNotifier.builderList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          builderAddNotifier
                              .builderList[index].BuilderFirstName,
                          //  builderAddNotifier.builderList[index].BuilderLastName,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  );
                })
              ],
            ))
      ],
    ));
  }
}
