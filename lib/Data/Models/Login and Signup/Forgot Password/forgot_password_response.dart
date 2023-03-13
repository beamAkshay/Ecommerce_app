

import 'package:json_annotation/json_annotation.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Forgot%20Password/response_data.dart';
part 'forgot_password_response.g.dart';

@JsonSerializable()
class ForgotPasswordResponse
{
  
  final ResponseData? data;

  ForgotPasswordResponse(this.data);

 factory ForgotPasswordResponse.fromJson(Map<String, dynamic> forgotPasswordResponse) =>
      _$ForgotPasswordResponseFromJson(forgotPasswordResponse);
  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);

  @override
  String toString() {
    return 'ForgotPasswordResponse(data:$data,)';
  }



}