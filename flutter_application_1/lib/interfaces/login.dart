// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, must_be_immutable, prefer_const_constructors_in_immutables, deprecated_member_use, unused_local_variable, avoid_unnecessary_containers, unnecessary_new, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/interfaces/browse.dart';
import 'package:flutter_application_1/interfaces/edit_profile.dart';
import 'package:flutter_application_1/interfaces/signup.dart';
import 'package:flutter_application_1/models/BuilderSignup.dart';
import 'package:flutter_application_1/Responses/Builder_Auth.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool _secureText = true;

  //Future<Builder_login_Signup_Info>? _futureBuilderSignup;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  BuilderLoginSignupController login = BuilderLoginSignupController();
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

  void _passSnackbar(String status) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        status,
        textAlign: TextAlign.center,
        style: TextStyle(),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _tryLogin(String email, String password) async {
    try {
      var loginresponse = await login.loginBuilder(email, password);
      if (loginresponse == 'Successfully logged in') {
        _passSnackbar('Successful');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditProfile(),
          ),
        );
      } else {
        _failSnackbar(loginresponse);
      }
    } catch (e) {
      _failSnackbar(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var child;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/cons.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 80.0),
                Text(
                  'Bunyaad', // top logo
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor,
                    fontFamily: 'Billabong',
                  ),
                ),
                SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: TextFormField(
                    // username text field
                    controller: _email,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: kLoginColor,
                        fontSize: 12.0,
                        fontFamily: 'Mont',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: TextFormField(
                    //password text field
                    controller: _password,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        color: kLoginColor,
                        fontSize: 12.0,
                        fontFamily: 'Mont',
                      ),
                      prefixIcon: Icon(
                        Icons.login,
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
                SizedBox(height: 7.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(kPrimaryColor),
                      ),
                      onPressed: () {
                        //FOGOT PASSWORD PAGE;
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 45.0),
                Padding(
                  // login button
                  padding: EdgeInsets.all(50.0),
                  child: FlatButton(
                    color: kPrimaryColor,
                    onPressed: () {
                      // go  to builder profile
                      _tryLogin(_email.text, _password.text);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text(
                      'Login',
                      style: TextStyle(
                        color: kLoginColor,
                      ),
                    )),
                  ),
                ),
                //SizedBox(height: 1.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Dont have an account?',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        color: kLoginColor,
                        fontFamily: 'Oswald',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(kSignupColor),
                      ),
                      onPressed: () {
                        //SIGNUP PAGE;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signup(),
                            ));
                      },
                      child: Text('Sign Up',
                          style: TextStyle(
                            color: kPrimaryColor,
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
