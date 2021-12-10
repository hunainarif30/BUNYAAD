// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, use_full_hex_values_for_flutter_colors, avoid_unnecessary_containers, sized_box_for_whitespace, must_be_immutable, deprecated_member_use, prefer_final_fields, unused_field, unused_local_variable, avoid_print, non_constant_identifier_names, use_key_in_widget_constructors, unused_label, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/interfaces/browse.dart';
import 'package:flutter_application_1/interfaces/login.dart';
import 'package:flutter_application_1/providers/builderAddNotifier.dart';
import 'package:flutter_application_1/interfaces/builders.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _secureText = true;

  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Form(
        autovalidate: true,
        key: _formkey,
        child: Container(
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
                        child: TextFormField(
                          //controller: _firstname,
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
                          validator: RequiredValidator(errorText: "Required**"),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: TextFormField(
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
                          validator: RequiredValidator(errorText: "Required**"),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: TextFormField(
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
                    validator: EmailValidator(errorText: "Wrong Email"),
                  ),
                ),
                //   SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: TextFormField(
                    controller: _passwordController,
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
                    validator: MultiValidator([
                      PatternValidator(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                          errorText:
                              'Must have 1 Upper case, 1 Lower Case , 1 Digit , 1 Special Charachter '),
                      MinLengthValidator(4,
                          errorText: "Must be atleast 4 charachters"),
                    ]),
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
                  padding: const EdgeInsets.all(50.0),
                  child: FlatButton(
                    color: kPrimaryColor,
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                content: Text('Successfull',
                                    style: TextStyle(
                                      color: Colors.green,
                                    ))));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Browse(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                content: Text('Invalid Data',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ))));
                      }
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
      ),
    );
  }
}
