// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'dart:async';

import 'package:flutter_application_1/Responses/exception.dart';
import 'package:http/http.dart' as http;

class BuilderRepository {
  Future<dynamic> getAllBuilderDetails({String email}) async {
    print('email from builde: ${email}');
    // post request to get schema
    try {
      final response = await http.post(
        Uri.parse('http://192.168.18.139:3000/api/builders/BuilderProfile'),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
        body: jsonEncode(
          <String, String>{
            'email': email,
          },
        ),
      );
      var decodeData = _response(response);
      print('response from builder repository: ${decodeData}');
      var Signupresponse = decodeData['Response'];
      if (Signupresponse == 'ok') {
        // sab huga ab sara ana chayie *backend * yahan sirf schema
        return response;
      }
    } catch (e) {
      print(e);
    }
  }

  // Future<dynamic> SendBuilderInfo(
  //     String job_detail,
  //     String qualification,
  //     String skills,
  //     String company_info,
  //     String website,
  //     String industry) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse('http://192.168.18.139:3000/api/builders/BuilderProfile'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json;charset=UTF-8',
  //         'Charset': 'utf-8',
  //       },
  //       body: jsonEncode(
  //         <String, String>{
  //           'Jobdetail': job_detail,
  //           'Qualification': qualification,
  //           'Skills': skills,
  //           'Companyinfo': company_info,
  //           'Website': website,
  //           'Industry': industry,
  //         },
  //       ),
  //     );
  //     var decodedData = json.decode(response.body);
  //     var decodeData = _response(response);
  //     var profileresponse = decodeData['Response'];

  //     if (profileresponse == 'Data Received') {
  //       print('ok');

  //       return decodedData;
  //     } else {
  //       return decodedData;
  //     }
  //   } catch (e) {
  //     print(e);
  //     return e.toString();
  //   }
  // }

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
