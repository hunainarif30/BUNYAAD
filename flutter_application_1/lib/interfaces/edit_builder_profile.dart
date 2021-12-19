// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, deprecated_member_use, unnecessary_new, sized_box_for_whitespace, duplicate_import, non_constant_identifier_names, unused_field, use_function_type_syntax_for_parameters, prefer_const_constructors_in_immutables, unnecessary_string_interpolations

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

class Edit_Builder_Profile extends StatefulWidget {
  const Edit_Builder_Profile({Key key}) : super(key: key);

  @override
  _Edit_Builder_ProfileState createState() => _Edit_Builder_ProfileState();
}

class _Edit_Builder_ProfileState extends State<Edit_Builder_Profile> {
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
  void initState() {
    _firstname.dispose();
    _lastname.dispose();
    _job_detail.dispose();
    _qualification.dispose();
    _company_info.dispose();
    _skills.dispose();
    _website.dispose();
    _industry.dispose();
    phonenumber.dispose();
    super.initState();
  }

  void _failSnackbar(String error) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        error,
        textAlign: TextAlign.center,
        style: TextStyle(),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void sendData(
      String firstname,
      String lastname,
      String job_detail,
      String qualification,
      String skills,
      String company_info,
      String website,
      String industry,
      String phonenumber) async {
    try {
      var response = await sendinfo.updateBuilderInfo(
          firstname,
          lastname,
          job_detail,
          qualification,
          skills,
          company_info,
          website,
          industry,
          phonenumber);
      if (response == 'ok') {
        print('Data Update krdiya tunay <3');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Profile(),
          ),
        );
      } else {
        _failSnackbar(response);
      }
    } catch (e) {
      _failSnackbar(e.toString());
    }
  }

  @override
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
          SizedBox(
            height: 15.0,
          ),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    sendData(
                        _firstname.text,
                        _lastname.text,
                        _job_detail.text,
                        _qualification.text,
                        _skills.text,
                        _company_info.text,
                        _website.text,
                        _industry.text,
                        phonenumber.text);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      onPrimary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 12)),
                  child: Text(' Save Chnages')),
            ],
          ),
          SizedBox(height: 15.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'First Name',
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                child: TextFormField(
                  initialValue:
                      '${context.read<BuilderLoginSignupController>().getLoggedInBuilder.firstname}}',
                  controller: _firstname,
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
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Last Name',
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                child: TextFormField(
                  initialValue:
                      '${context.read<BuilderLoginSignupController>().getLoggedInBuilder.lastname}}',
                  controller: _lastname,
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
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Qualificatons',
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                child: TextFormField(
                  initialValue:
                      '${context.read<BuilderLoginSignupController>().getLoggedInBuilder.qualification}}',
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
              SizedBox(
                height: 15.0,
              ),
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
              SizedBox(height: 15.0),
              Container(
                child: TextFormField(
                  initialValue:
                      '${context.read<BuilderLoginSignupController>().getLoggedInBuilder.skills}}',
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
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Company Information',
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                child: TextFormField(
                  initialValue:
                      '${context.read<BuilderLoginSignupController>().getLoggedInBuilder.company_info}}',
                  controller: _company_info,
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
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Web Site',
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                child: TextFormField(
                  initialValue:
                      '${context.read<BuilderLoginSignupController>().getLoggedInBuilder.website}}',
                  controller: _website,
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
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Industry',
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                child: TextFormField(
                  initialValue:
                      '${context.read<BuilderLoginSignupController>().getLoggedInBuilder.industry}}',
                  controller: _industry,
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
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Phone number',
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                child: TextFormField(
                  initialValue:
                      '${context.read<BuilderLoginSignupController>().getLoggedInBuilder.phonenumber}',
                  controller: phonenumber,
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
            ],
          ),
        ],
      ),
    );
  }
}
