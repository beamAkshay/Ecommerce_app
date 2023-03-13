import 'package:json_annotation/json_annotation.dart';
part 'logout_details.g.dart';

@JsonSerializable()
class LogoutDetails {
  @JsonKey(name: "Responce")
  final String? response;

  LogoutDetails(this.response);

  factory LogoutDetails.fromJson(Map<String, dynamic> logoutData) =>
      _$LogoutDetailsFromJson(logoutData);
  Map<String, dynamic> toJson() => _$LogoutDetailsToJson(this);

  @override
  String toString() {
    return 'UserData(id:$response,)';
  }
}
