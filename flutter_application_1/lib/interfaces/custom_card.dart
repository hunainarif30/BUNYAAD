// ignore_for_file: unused_import, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, dead_code, prefer_typing_uninitialized_variables, non_constant_identifier_names, unnecessary_string_interpolations, camel_case_types, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_final_fields, override_on_non_overriding_member, unused_field, annotate_overrides, must_be_immutable, unnecessary_brace_in_string_interps, recursive_getters

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/interfaces/login.dart';
import 'package:flutter_application_1/interfaces/signup.dart';
import 'package:flutter_application_1/providers/favBuilderNotifier.dart';
import 'package:flutter_application_1/interfaces/FavBuilder.dart';
import 'package:provider/provider.dart';

class custom_card extends StatefulWidget {
  final String name;
  final String image;
  int rating;
  var index;
  final String comp_name;
  custom_card(this.name, this.image, this.rating, this.comp_name);

  @override
  State<custom_card> createState() => _custom_cardState();
}

class _custom_cardState extends State<custom_card> {
  Color _favIconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                child: Container(
                  width: 90.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('${widget.image}'), fit: BoxFit.fill),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      '${widget.name}',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      '${widget.comp_name} ',
                      style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Rating: ',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            color: Colors.grey,
                          ),
                        ),
                        for (var i = 0; i < widget.rating; i++)
                          Icon(Icons.star, size: 13.0),
                      ],
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.favorite_border_sharp),
                color: _favIconColor,
                onPressed: () async {
                  await Provider.of<FavBuilderNotifier>(context, listen: false)
                      .addFavBuilder(widget.name, widget.image, widget.rating,
                          widget.comp_name);
                  setState(() {
                    if (_favIconColor == Colors.black) {
                      _favIconColor = Colors.red;
                    } else {
                      _favIconColor = Colors.black;
                    }
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
