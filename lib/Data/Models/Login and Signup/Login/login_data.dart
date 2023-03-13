import 'package:json_annotation/json_annotation.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Login/user_data.dart';
part 'login_data.g.dart';

@JsonSerializable()
class LoginData {
  @JsonKey(name: "data")
  final UserData? userData;
  final bool? status;
  final String? message;

  LoginData(this.userData, this.status, this.message);

  factory LoginData.fromJson(Map<String, dynamic> userData) =>
      _$LoginDataFromJson(userData);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);

  @override
  String toString() {
    return 'LoginData(userData: $userData,status:$status,message:$message)';
  }
}
