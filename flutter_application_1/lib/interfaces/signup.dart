// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, use_full_hex_values_for_flutter_colors, avoid_unnecessary_containers, sized_box_for_whitespace, must_be_immutable, deprecated_member_use, prefer_final_fields, unused_field, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/interfaces/browse.dart';
import 'package:flutter_application_1/interfaces/login.dart';
import 'package:flutter_application_1/providers/builderAddNotifier.dart';
import 'package:flutter_application_1/interfaces/builders.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _secureText = true;
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/signup_back.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 80.0,
              ),
              Center(
                child: Text(
                  'Bunyaad', // top logo
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor,
                    fontFamily: 'Billabong',
                  ),
                ),
              ),

              SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0, left: 10.0),
                      child: TextField(
                        controller: _firstname,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                          ),
                          labelText: 'First Name',
                          labelStyle: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Mont',
                          ),
                          prefixIcon: Icon(
                            Icons.border_color_outlined,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextField(
                        controller: _lastname,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                          ),
                          labelText: 'Last Name',
                          labelStyle: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Mont',
                          ),
                          prefixIcon: Icon(
                            Icons.border_color_outlined,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    labelText: 'Email Address',
                    labelStyle: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Mont',
                    ),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                    ),
                  ),
                ),
              ),
              //   SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Mont',
                    ),
                    prefixIcon: Icon(
                      Icons.vpn_key_outlined,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        setState(() {
                          _secureText = !_secureText;
                        });
                      },
                    ),
                  ),
                  obscureText: _secureText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    labelText: 'Confirm Passsword',
                    labelStyle: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Mont',
                    ),
                    prefixIcon: Icon(
                      Icons.vpn_key_outlined,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        setState(() {
                          _secureText = !_secureText;
                        });
                      },
                    ),
                  ),
                  obscureText: _secureText,
                ),
              ),

              Padding(
                // signup button
                padding: EdgeInsets.all(50.0),
                child: FlatButton(
                  color: kPrimaryColor,
                  onPressed: () async {
                    // go  to builder profile
                    await Provider.of<BuilderAddNotifier>(context,
                            listen: false)
                        .addBuilder(_firstname.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Browse(),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(child: Text('Sign Up')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
