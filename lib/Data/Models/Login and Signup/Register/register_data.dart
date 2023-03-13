import 'package:json_annotation/json_annotation.dart';
part 'register_data.g.dart';

@JsonSerializable()
class RegisterData {
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phone;
  final String? gst;
  final String? company;

  @JsonKey(name: "email_subscribe")
  final int? emailSubscribe;
  final String? password;

  RegisterData({this.firstname, this.lastname, this.email, this.phone, this.gst, this.company, this.emailSubscribe, this.password});


   factory RegisterData.fromJson(Map<String, dynamic> registerData) =>
      _$RegisterDataFromJson(registerData);
  Map<String, dynamic> toJson() => _$RegisterDataToJson(this);


  @override
  String toString() {
    return 'RegisterData(firstname: $firstname, lastname: $lastname, email: $email, phone: $phone, gst: $gst, company: $company, emailSubscribe: $emailSubscribe, password: $password)';
  }
}
