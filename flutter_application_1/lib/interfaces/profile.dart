// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/builder_controller.dart';
import 'package:flutter_application_1/Responses/Builder_Auth.dart';
import 'package:flutter_application_1/interfaces/edit_builder_profile.dart';
import 'package:flutter_application_1/interfaces/edit_profile.dart';
import 'package:flutter_application_1/models/BuilderSignup.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //Builder1 b;
//  BuilderLoginSignupController getinfo = BuilderLoginSignupController();
  // Builder1 builders;
  // Builder1 get Builderdetail => builders;

  @override
  // void initState() {

  // print(jjbj
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
  // super.initState();
  // print(Builderdetail.email);
  // final i = Provider.of<BuilderLoginSignupController>(context, listen: false)
  //     .getLoggedInBuilder
  //     .email;
  // print(i);
  // print(
  //     '${Provider.of<BuilderLoginSignupController>(context, listen: false).getLoggedInBuilder.email.toString()}');

  //Provider.of<BuilderLoginSignupController>(context, listen: false).check();
  //}

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
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    '${Provider.of<BuilderLoginSignupController>(context, listen: false).getLoggedInBuilder.firstname}',
                    // 'Hunain',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(
                    // 'Arif',
                    '${Provider.of<BuilderLoginSignupController>(context, listen: false).getLoggedInBuilder.lastname}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '${Provider.of<BuilderLoginSignupController>(context, listen: false).getLoggedInBuilder.email}',
                // 'hunainarif30@gmail.com',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Edit_Builder_Profile(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      onPrimary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 12)),
                  child: Text(' Edit Profile')),
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
                '${Provider.of<BuilderLoginSignupController>(context, listen: false).getLoggedInBuilder.industry}'),
            //'HR manager',
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
              // ignore: prefer_const_literals_to_create_immutables
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text('DEVELOPER')
                Text(
                    '${context.read<BuilderLoginSignupController>().getLoggedInBuilder.skills}')
              ],
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
                  // ignore: prefer_const_literals_to_create_immutables
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
                    Text(
                        '${context.read<BuilderLoginSignupController>().getLoggedInBuilder.website}'),
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
                    Text(
                        '${context.read<BuilderLoginSignupController>().getLoggedInBuilder.phonenumber}'),
                    //  Text('03008978401'),
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
                    Text(
                        '${context.watch<BuilderLoginSignupController>().getLoggedInBuilder.industry}'),
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
