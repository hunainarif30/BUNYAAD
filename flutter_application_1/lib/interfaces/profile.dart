// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/builder_controller.dart';
import 'package:flutter_application_1/Responses/Builder_Auth.dart';
import 'package:flutter_application_1/models/BuilderSignup.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Builder_Controller sendinfo = Builder_Controller();
  // Builder1 builders;
  // Builder1 get Builderdetail => builders;

  @override
//  void initState() {
  // print(
  //Provider.of<BuilderLoginSignupController>(context, listen: false).getLoggedInBuilder.email.toString()}');
  // Provider.of<Builder_Controller>(context, listen: false).getAllUserDetails(
  //     email: Provider.of<BuilderLoginSignupController>(context, listen: false)
  //         .getLoggedInBuilder
  //         .email);

  // context.read<Builder_Controller>().getAllUserDetails(context
  //     .read<BuilderLoginSignupController>()
  //     .getLoggedInBuilder
  //     .email
  //     .toString());
  //  super.initState();
  // print(Builderdetail.email);
  // final i = Provider.of<BuilderLoginSignupController>(context, listen: false)
  //     .getLoggedInBuilder
  //     .email;
  // print(i);
  // print(
  //     '${Provider.of<BuilderLoginSignupController>(context, listen: false).getLoggedInBuilder.email.toString()}');

  //Provider.of<BuilderLoginSignupController>(context, listen: false).check();
//  }

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
              Text(
                'Hunain Arif',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                'hunainarfi30@gmail.com',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      onPrimary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 12)),
                  child: Text(' Save changes')),
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
            child: Text(
                '${context.watch<BuilderLoginSignupController>().getLoggedInBuilder.job_detail}'),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    '${context.watch<BuilderLoginSignupController>().getLoggedInBuilder.qualification}')
              ],
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '${context.watch<BuilderLoginSignupController>().getLoggedInBuilder.skills}')
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Company Information:',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Web site:',
                          style: TextStyle(
                            fontFamily: 'Mont',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                          '${context.watch<BuilderLoginSignupController>().getLoggedInBuilder.website}'),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 50.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 11,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            labelText: 'Contact Number: ',
                            labelStyle: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'Mont',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 50.0),
                          child: Text(
                              '${context.watch<BuilderLoginSignupController>().getLoggedInBuilder.industry}')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
