import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:grabbo/prefbox.dart';

import '../error/api_error.dart';
import 'package:http/http.dart' as http;

import 'constant.dart';


class LoginService{


  /// Verify login otp api

  Future<String?> getLoginOTP(String phone) async {
    const url = '${root}users/logIn_otp';
    final body = {
      'phone': phone,
      'channel': 'SMS'
    };
    try {
      final response = await http.post(Uri.parse(url), body: json.encode(body), headers: headers);
      final responseBody = json.decode(response.body);
      if (responseBody['status'] == true) {
        await prefsBox.put(kUserId, responseBody["user_id"]);
        return responseBody['message'];
      }else{
        throw ApiError.fromResponse(responseBody['message']);
      }
    } catch (e) {
      _handleError(e);
    }
    return null;
  }

  Future<String?> verifyLoginOTP(String otp) async {
    const url = '${root}users/verify_otp';
    final body = {
      'user_id': userId,
      'otp' : otp
    };
    try {
      final response = await http.post(Uri.parse(url), body: json.encode(body), headers: headers);
      final responseBody = json.decode(response.body);
      if (responseBody['status'] == true) {
        return responseBody['message'];
      }else{
        throw ApiError.fromResponse(responseBody['message']);
      }
    } catch (e) {
      _handleError(e);
    }
    return null;
  }



  _handleError(var e) {
    if (e is String) throw e;
    if (e is SocketException) throw ApiError.internet();
    if (e is TimeoutException) throw ApiError.timeOut();
    if (e is ApiError) throw e;
    throw ApiError.unKnown();
  }

}