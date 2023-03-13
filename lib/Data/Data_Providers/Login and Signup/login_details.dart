import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Forgot%20Password/forgot_password_response.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Login/login_data.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Logout/logout_details.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Register/register_data.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Register/register_response.dart';
import 'package:unicorn_store/constant/constant.dart';

class LoginDetailsApi {
  //User Login
  Future<LoginData> getLoginDetails(String username, String password) async {
    String url = "$kDefaultBaseUrl/login";
    Map data = {
      'email_id': username,
      'password': password,
    };
    String body = json.encode(data);
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      var data = LoginData.fromJson(decode);
      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }

  //User Logout
  Future<LogoutDetails> getLogoutDetails(String token) async {
    String url = "$kDefaultBaseUrl/logout";

    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      "X-Auth-Token": token,
      "Connection": "keep-alive"
    });

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      var data = LogoutDetails.fromJson(decode);
      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }

  //Forgot password Api call
  Future<ForgotPasswordResponse> forgotPasswordDetails(String emailId) async {
    String url = "$kDefaultBaseUrl/forgot_password?email=$emailId";

    var response = await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      var data = ForgotPasswordResponse.fromJson(decode);
      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }

  //User Registration
  Future<RegisterResponse> registerUserDetails(
      RegisterData registerData) async {
    String url = "$kDefaultBaseUrl/register";

    String body = json.encode(registerData);

    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);

      var data = RegisterResponse.fromJson(decode);
      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }

  //User login with otp
  Future<Map<String, dynamic>> sendOtpRequest(String mobileNumber) async {
    String url = "$kDefaultBaseUrl/login_with_otp?phone=$mobileNumber";
    // Map data = {
    //   'email_id': username,
    //   'password': password,
    // };
    // String body = json.encode(data);
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      return decode;
    } else {
      throw Exception(response.statusCode);
    }
  }

  //Get User Login details based on OTP
  Future<LoginData> getLoginDetailsBasedOnOtp(String phone, String otp) async {
    String url = "$kDefaultBaseUrl/verify_login_otp";
    Map data = {
      'phone': phone,
      'otp': otp,
    };
    String body = json.encode(data);
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      var data = LoginData.fromJson(decode);
      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
