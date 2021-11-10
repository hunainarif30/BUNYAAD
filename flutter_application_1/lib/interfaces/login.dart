// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, must_be_immutable, prefer_const_constructors_in_immutables, deprecated_member_use, unused_local_variable, avoid_unnecessary_containers, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/interfaces/browse.dart';
import 'package:flutter_application_1/interfaces/signup.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool _secureText = true;

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
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        color: kLoginColor,
                        fontSize: 12.0,
                        fontFamily: 'Mont',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                      prefixIcon: Icon(
                        Icons.star,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: TextFormField(
                    //password text field
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

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Browse(),
                          ));
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
