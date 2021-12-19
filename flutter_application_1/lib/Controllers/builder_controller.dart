// ignore_for_file: camel_case_types, non_constant_identifier_names, unused_import

import 'dart:convert';
import 'package:flutter_application_1/Responses/exception.dart';
import 'package:flutter_application_1/models/BuilderSignup.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_application_1/Responses/builder_repository.dart';

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Builder_Controller extends ChangeNotifier {
  // BuilderRepository brepository = BuilderRepository();

  Builder1 _builder;

  Builder1 get getLoggedInBuilder =>
      _builder; // ab ye wala builder use huga puri app me
  //BuilderRepository repositoryController = BuilderRepository();
  Future<dynamic> getAllUserDetails({String email}) async {
    print('builder controller email : $email');
    // var response = await brepository.getAllBuilderDetails(email: email);
    // var decodedData = json.decode(response.body);
    try {
      final response = await http.post(
        Uri.parse('http://172.20.10.3:3000/api/builders/BuilderProfile'),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8',
        },
        body: jsonEncode(
          <String, String>{
            'email': email,
          },
        ),
        // print(email);
      );

      // print(response);
      // print('builder_controller response ${response.body}');
      var decodedData = json.decode(response.body);
      var decodeData = _response(response);
      // print('response from builder repository: ${decodeData}');
      var Signupresponse = decodeData['Response'];
      if (Signupresponse == 'ok') {
        //  _builder = Builder1.fromJson(decodedData);
        return decodedData;
      }

      //   // sab huga ab sara ana chayie *backend * yahan sirf schema
      //   //return response;
      // }
    } catch (e) {
      print(e);
    }
  }

  // _builder = Builder1.fromJson(decodedData);
  // print(decodedData);
  // print(_builder.email);
  // print(_builder.company_info);
  // print(_builder.industry);

// Updating Builder Profile
  Future<dynamic> updateBuilderInfo(
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
      var response = await http.put(
        Uri.parse('http://192.168.18.139:3000/api/builders/BuilderProfile'),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
        body: jsonEncode(
          <String, String>{
            'Firstname': firstname,
            'Lastname': lastname,
            'Jobdetail': job_detail,
            'Qualification': qualification,
            'Skills': skills,
            'Companyinfo': company_info,
            'Website': website,
            'Industry': industry,
            'Phone': phonenumber
          },
        ),
      );
      var decodeData = _response(response);
      //   print('response from builder repository: ${decodeData}');
      var Signupresponse = decodeData['Response'];
      if (Signupresponse == 'ok') {
        _builder.company_info = company_info;
        _builder.industry = industry;
        _builder.job_detail = job_detail;
        _builder.qualification = qualification;
        _builder.skills = skills;
        notifyListeners();
        // sab huga ab sara ana chayie *backend * yahan sirf schema
        return Signupresponse;
      }
    } catch (e) {
      print(e);
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

  // void editBuilder_info(
  //     {String newbuildercompany_info,
  //     String newindustry,
  //     String newjob_detail,
  //     String newqualification,
  //     String newskills}) {
  //   _builder.company_info = newbuildercompany_info;
  //   _builder.industry = newindustry;
  //   _builder.job_detail = newjob_detail;
  //   _builder.qualification = newqualification;
  //   _builder.skills = newskills;
  //   notifyListeners();
  // }
}
