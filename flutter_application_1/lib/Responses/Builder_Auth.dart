// ignore_for_file: file_names, unused_import, non_constant_identifier_names, unused_local_variable, unused_field

import 'dart:convert';
import 'package:flutter_application_1/Controllers/builder_controller.dart';
import 'package:flutter_application_1/Responses/exception.dart';
import 'package:flutter_application_1/interfaces/signup.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_application_1/models/BuilderSignup.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Builder1 builders;
//Builder1 get getLoggedInBuilder => builders1;

class BuilderLoginSignupController extends ChangeNotifier {
  Builder_Controller builderController = Builder_Controller();

  Builder1 get getLoggedInBuilder => builders;

  // Builder1 get getLoggedInBuilder => _builders;
  // BuilderLoginSignupController b;
  // BuilderLoginSignupController get testfunc => b;
  // String get getLoggedInBuilderEmail => _builders.email;
  // void test() {
  //   print(_builders.email);
  // }

  // bool _userIsLoggedIn = false;
  Signup_builder(String firstname, String lastname, String email,
      String password, String phonenumber) async {
    var msg = '';
    try {
      final response = await http.post(
        Uri.parse('http://172.20.10.3:3000/api/builders/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8',
        },
        body: jsonEncode(
          <String, String>{
            'Firstname': firstname,
            'Lastname': lastname,
            'email': email,
            'password': password,
            'Phone': phonenumber,
          },
        ),
      );
      print('signup response :  ${response.body}');
      var decodedData = json.decode(response.body);
      var decodeData = _response(response);

      var Signupresponse = decodeData['Response'];
      if (Signupresponse == 'Successfully signed up') {
        // areeb se response me jou uper dia he wahin wapsi aega with Response bhi jis me Successfully signed up hug
        builders = Builder1.fromJson(decodedData);
        var response1 =
            await builderController.getAllUserDetails(email: builders.email);
        var decodedData1 = response1;
        builders = Builder1.fromJson(decodedData1);

        // print('qualification: ${builders.qualification}');
        print(decodedData1);

        //  print('ok');
        msg = Signupresponse;
      } else if (Signupresponse == 'User already registered') {
        msg = Signupresponse;
      }
    } catch (e) {
      print(e);
      msg = e.toString();
    }
    return msg;
  }

  Future<dynamic> loginBuilder(String email, String builderPassword) async {
    try {
      var response = await http.post(
        Uri.parse('http://192.168.18.139:3000/api/builders/login'),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
        body: jsonEncode(
          <String, String>{
            "email": email,
            "password": builderPassword,
          },
        ),
      );
      var decodeData = _response(response);
      var Loginresponse = decodeData['Response'];

      if (Loginresponse == 'Successfully logged in') {
        builders = Builder1.fromJson(decodeData);
        // _userIsLoggedIn = true;
        return Loginresponse;
      }
    } catch (e) {
      return e.toString();
    }
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        var responseJson = json.decode(response.body);
        throw BadRequestException(responseJson['Response'].toString());
      case 401:
      case 403:
        var responseJson = json.decode(response.body);
        throw UnauthorisedException(responseJson['Response'].toString());
      case 500:
      default:
        throw FetchDataException('No Internet Connection');
    }
  }
}
