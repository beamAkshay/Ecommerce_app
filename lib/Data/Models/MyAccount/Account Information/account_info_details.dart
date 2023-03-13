import 'package:json_annotation/json_annotation.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Account%20Information/address_details.dart';
part 'account_info_details.g.dart';

@JsonSerializable()
class AccountInfoDetails
{
   final AddressDetails? data;

  AccountInfoDetails(this.data);
  
   factory AccountInfoDetails.fromJson(Map<String, dynamic> accountInfoDetails) =>
      _$AccountInfoDetailsFromJson(accountInfoDetails);
  Map<String, dynamic> toJson() => _$AccountInfoDetailsToJson(this);

  @override
  String toString() {
    return 'AccountInfoDetails(data: $data, )';
  }

}