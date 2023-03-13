import 'package:json_annotation/json_annotation.dart';
part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse
{

 @JsonKey(name: "Responce")
 final String? response;

  RegisterResponse(this.response);

    factory RegisterResponse.fromJson(Map<String, dynamic> registerResponse) =>
      _$RegisterResponseFromJson(registerResponse);
  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);

  @override
  String toString() {
    return 'RegisterResponse(Response:$response,)';
  }

}