// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:unicorn_store/Data/Data_Providers/Login%20and%20Signup/login_details.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Forgot%20Password/forgot_password_response.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Login/login_data.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Logout/logout_details.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Register/register_data.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Register/register_response.dart';

class LoginDetailsRepository {
  final loginDetailsApi = LoginDetailsApi();

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  final _tokenDataKey = "tokenDataKey";
  final _onBoardingDataKey = "onBoardingDataKey";

  //Getting login response
  Future<LoginData> getLoginDetails(String username, String password) {
    return loginDetailsApi.getLoginDetails(username, password);
  }

  //Getting logout response
  Future<LogoutDetails> getLogoutDetails(String token) {
    return loginDetailsApi.getLogoutDetails(token);
  }

  //Forgot Password response
  Future<ForgotPasswordResponse> forgotPasswordDetails(String emailId) {
    return loginDetailsApi.forgotPasswordDetails(emailId);
  }

  //send otp request
  Future<Map<String,dynamic>> sendOtpRequest(String mobileNumber)
  {
    return loginDetailsApi.sendOtpRequest(mobileNumber);
  }

    //Getting login response based on OTP
  Future<LoginData> getLoginDetailsBasedOnOtp(String phone, String otp) {
    return loginDetailsApi.getLoginDetailsBasedOnOtp(phone, otp);
  }


  //User Registration Response
   Future<RegisterResponse> registerUserDetails(RegisterData registerData) {
    return loginDetailsApi.registerUserDetails(registerData);
  }

  // delete from local storage
  Future<void> deleteToken() async {
    print("Deleting token");

    await storage.delete(key: _tokenDataKey);
    await Future.delayed(const Duration(seconds: 1));
    return;
  }

  // write to keystore/keychain
  Future<void> persistToken(LoginData loginData) async {
    print("Adding token");
    await storage.write(key: _tokenDataKey, value: json.encode(loginData));

    await Future.delayed(const Duration(seconds: 1));
    return;
  }

  // read from keystore/keychain
  Future<bool> hasToken() async {
    var flag = await storage.read(key: _tokenDataKey);
    print("Reading token $flag");
    await Future.delayed(const Duration(seconds: 1));
    return flag != null;
  }

  //For getting data from local storage
  Future<String?> getTokenData() async {
    var data = await storage.read(key: _tokenDataKey);
    await Future.delayed(const Duration(seconds: 1));
    return data;
  }

  //Adding data for onBoarding Page
  Future<void> addingOnBoardingScreenData() async {
    print("Adding addingOnBoardingScreenData");

    await storage.write(key: _onBoardingDataKey, value: "true");

    await Future.delayed(const Duration(seconds: 1));
    return;
  }

  //Cheking OnBoarding Screen Data
  Future<bool> hasOnBoardingScreenData() async {
    var flag = await storage.read(key: _onBoardingDataKey);
    print("Reading onBoardingData $flag");
    await Future.delayed(const Duration(seconds: 1));
    return flag != null;
  }
}
