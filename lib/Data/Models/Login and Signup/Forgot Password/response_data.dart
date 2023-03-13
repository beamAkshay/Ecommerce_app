import 'package:json_annotation/json_annotation.dart';
part 'response_data.g.dart';


@JsonSerializable()
class ResponseData
{
   
   final String? responce;

  ResponseData(this.responce);


    factory ResponseData.fromJson(Map<String, dynamic> forgotData) =>
      _$ResponseDataFromJson(forgotData);
  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);

  @override
  String toString() {
    return 'ResponseData(id:$responce,)';
  }


}