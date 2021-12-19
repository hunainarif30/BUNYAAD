// ignore_for_file: unused_import, prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, override_on_non_overriding_member, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';

class chat extends StatelessWidget {
  chat({Key key}) : super(key: key);
  final TextEditingController _message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Chat Box',
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.w400,
              fontFamily: 'Billabong',
            ),
            textAlign: TextAlign.center),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                  child: TextFormField(
                    autocorrect: true,
                    controller: _message,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      labelText: 'Type Message',
                      labelStyle: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Mont',
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.send),
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
