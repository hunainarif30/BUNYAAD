// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, deprecated_member_use, unnecessary_new, sized_box_for_whitespace, duplicate_import, non_constant_identifier_names, unused_field, use_function_type_syntax_for_parameters, prefer_const_constructors_in_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/builder_controller.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/interfaces/browse.dart';
import 'package:flutter_application_1/interfaces/login.dart';
import 'package:flutter_application_1/interfaces/profile.dart';
import 'package:flutter_application_1/providers/builderAddNotifier.dart';
import 'package:flutter_application_1/interfaces/builders.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/providers/builderAddNotifier.dart';
import 'package:flutter_application_1/interfaces/builders.dart';
import 'package:flutter_application_1/models/BuilderSignup.dart';
import 'package:flutter_application_1/Responses/Builder_Auth.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key key}) : super(key: key);

  @override
  State<EditProfile> createState() => _ProfileState();
}

class _ProfileState extends State<EditProfile> {
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _job_detail = TextEditingController();

  final TextEditingController _qualification = TextEditingController();

  final TextEditingController _skills = TextEditingController();

  final TextEditingController _company_info = TextEditingController();

  final TextEditingController _website = TextEditingController();

  final TextEditingController _industry = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();

  Builder_Controller sendinfo = Builder_Controller();

  @override
  // void _failSnackbar(String error) {
  //   final snackBar = SnackBar(
  //     behavior: SnackBarBehavior.floating,
  //     content: Text(
  //       error,
  //       textAlign: TextAlign.center,
  //       style: TextStyle(),
  //     ),
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  // void sendData(String job_detail, String qualification, String skills,
  //     company_info, website, industry) async {
  //   try {
  //     var response = await sendinfo.updateBuilderInfo(
  //         job_detail, qualification, skills, company_info, website, industry);
  //     if (response == 'ok') {
  //       print('Data Update krdiya tunay <3');
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => Profile(),
  //         ),
  //       );
  //     } else {
  //       _failSnackbar(response);
  //     }
  //   } catch (e) {
  //     _failSnackbar(e.toString());
  //   }
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('demo_builder/default.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: TextFormField(
                          controller: _firstname,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0)),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(new Radius.circular(25.0)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextFormField(
                        controller: _firstname,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0)),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(new Radius.circular(25.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //            Text(
              //       '${Provider.of<BuilderLoginSignupController>(context, listen: false).getLoggedInBuilder.firstname}',
              //       // 'Hunain',
              //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              //     ),
              //     Text(
              //       // 'Arif',
              //       '${Provider.of<BuilderLoginSignupController>(context, listen: false).getLoggedInBuilder.lastname}',
              //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                // '${Provider.of<BuilderLoginSignupController>(context, listen: false).getLoggedInBuilder.email}',
                'hunainarif30@gmail.com',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 10.0,
              ),
              // update operation perform hoongain
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      onPrimary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 12)),
                  child: Text(' Save Changes')),
            ],
          ),
          SizedBox(height: 50.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Job Detail',
              style: TextStyle(
                fontFamily: 'Mont',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextFormField(
                controller: _job_detail,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(new Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Qualifications',
              style: TextStyle(
                fontFamily: 'Mont',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextFormField(
                controller: _qualification,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(new Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Skills',
              style: TextStyle(
                fontFamily: 'Mont',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextFormField(
                controller: _skills,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(new Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Company Information:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Web site:',
                      style: TextStyle(
                        fontFamily: 'Mont',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 9.0),
                    ),
                    SizedBox(height: 10),
                    //   Text('www.bunyaad.com.pk'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: TextFormField(
                          controller: _website,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0)),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(new Radius.circular(25.0)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20, width: 9.0),
                    Text(
                      'Contact Number:',
                      style: TextStyle(
                        fontFamily: 'Mont',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10, width: 13.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: TextFormField(
                          controller: phonenumber,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0)),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(new Radius.circular(25.0)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 13.0,
                    ),
                    // SizedBox(height: 20, width: 9.0),

                    Text(
                      'Industry:',
                      style: TextStyle(
                        fontFamily: 'Mont',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      width: 9.0,
                    ),
                    //  Text('BUNYAAD BUILDERS'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: TextFormField(
                          controller: _job_detail,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0)),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(new Radius.circular(25.0)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
