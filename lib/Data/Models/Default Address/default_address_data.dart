// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:unicorn_store/Data/Models/Default%20Address/default_address_type_data.dart';

class DefaultAddressData {
  final bool? status;
  final DefaultAddressType? data;
  DefaultAddressData({
    this.status,
    this.data,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'data': data?.toJson(),
    };
  }

  factory DefaultAddressData.fromJson(Map<String, dynamic> map) {
    return DefaultAddressData(
      status: map['status'] != null ? map['status'] as bool : null,
      data: map['data'] != null
          ? DefaultAddressType.fromJson(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  String toString() => 'DefaultAddressData(status: $status, data: $data)';
}
