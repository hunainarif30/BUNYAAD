// ignore_for_file: unused_import, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, dead_code, prefer_final_fields, unused_field, must_be_immutable, prefer_const_constructors_in_immutables, avoid_types_as_parameter_names, unused_local_variable, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/interfaces/login.dart';
import 'package:flutter_application_1/interfaces/signup.dart';
import 'package:flutter_application_1/providers/builderAddNotifier.dart';
import 'package:flutter_application_1/interfaces/builders.dart';
import 'package:flutter_application_1/interfaces/custom_card.dart';

import 'package:flutter_application_1/providers/favBuilderNotifier.dart';
import 'package:flutter_application_1/interfaces/FavBuilder.dart';
import 'package:provider/provider.dart';

class Browse extends StatefulWidget {
  Browse({Key key}) : super(key: key);
  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    FavBuilderNotifier favbuildernotifier =
        Provider.of<FavBuilderNotifier>(context);

    return SafeArea(
        child: Scaffold(
            key: _globalKey,
            endDrawer: Drawer(
              child: Expanded(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back)),
                    ],
                  ),
                  Text(
                    'Favourute Builders',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                      color: kPrimaryColor,
                      fontFamily: 'Billabong',
                    ),
                  ),
                  Consumer<FavBuilderNotifier>(
                    builder: (context, favBuilderNotifier, _) {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: favBuilderNotifier.FavBuilderList.length,
                            itemBuilder: (BuildContext context, index) {
                              return Container(
                                child: Card(
                                  color: Colors.purple[100],
                                  elevation: 1.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 70.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  favBuilderNotifier
                                                      .FavBuilderList[index]
                                                      .image),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            favBuilderNotifier
                                                .FavBuilderList[index].name,
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.0,
                                            ),
                                          ),
                                          Text(
                                            favBuilderNotifier
                                                .FavBuilderList[index]
                                                .comp_name,
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            favBuilderNotifier
                                                .removeFavBuilder(index);
                                          },
                                          icon: Icon(Icons.remove_circle))
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    },
                  ),
                ],
              )),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    SizedBox(height: 200.0),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 200.0,
                        color: kPrimaryColor,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.favorite_outline_sharp,
                                      color: Colors.red),
                                  onPressed: () {
                                    _globalKey.currentState?.openEndDrawer();
                                  },
                                )
                              ],
                            ),
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
                                      borderSide:
                                          BorderSide(color: Colors.white),
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
                  ],
                ),
                //  SizedBox(height: 20.0),
                Expanded(
                  child: ListView(
                    children: [
                      custom_card('Areeb Baig', 'demo_builder/areeeb.jfif', 2,
                          'DAANT PRODUCTION'),
                      custom_card('Khizer Riaz', 'demo_builder/khizer.jpg', 3,
                          'NEECHE BUILDERS'),
                      custom_card('Taha Aslam', 'demo_builder/taha.jpg', 4,
                          'SHEHROZA ENTERPRIZES'),
                      custom_card('Hassan Inam', 'demo_builder/hassan.jpg', 1,
                          'INAM AND SONS'),
                      custom_card('Ramiz Zaheer', 'demo_builder/ramiz.jpg', 3,
                          'SERAIKI BUILDERS'),
                      // Consumer<BuilderAddNotifier>(
                      //   builder: (context, BuilderAddNotifier, _) {
                      //     return Expanded(
                      //       child: ListView.builder(
                      //         itemCount: BuilderAddNotifier.builderList.length,
                      //         itemBuilder: (BuildContext context, index) {
                      //           return Container(
                      //             height: 30.0,
                      //             width: 30.0,
                      //             child: Row(
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.spaceEvenly,
                      //               children: [
                      //                 Text(
                      //                   BuilderAddNotifier.builderList[index]
                      //                       .BuilderFirstName,
                      //                   style: TextStyle(
                      //                     fontSize: 15.0,
                      //                     fontWeight: FontWeight.bold,
                      //                     letterSpacing: 1.0,
                      //                   ),
                      //                 ),
                      //                 Text(
                      //                   BuilderAddNotifier
                      //                       .builderList[index].BuilderLastName,
                      //                   style: TextStyle(
                      //                     fontSize: 10.0,
                      //                     fontWeight: FontWeight.bold,
                      //                     letterSpacing: 1.0,
                      //                   ),
                      //                 ),
                      //                 Text(
                      //                   BuilderAddNotifier
                      //                       .builderList[index].BuilderEmail,
                      //                   style: TextStyle(
                      //                     fontSize: 10.0,
                      //                     fontWeight: FontWeight.bold,
                      //                     letterSpacing: 1.0,
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           );
                      //         },
                      //       ),
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
