// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:unicorn_store/Data/Models/Filter/Filter%20Product%20List/filter_product_details.dart';
import 'package:unicorn_store/Data/Models/Filter/filter_attributes.dart';

class FilterData {
  final bool? status;
  final int? total_count;
  final List<FilterAttributes>? attributes;
  final List<FilterProductDetails>? data;
  FilterData({
    this.status,
    this.total_count,
    this.attributes,
    this.data,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'total_count': total_count,
      'attributes': attributes!.map((x) => x.toJson()).toList(),
      'data': data!.map((x) => x.toJson()).toList(),
    };
  }

  factory FilterData.fromJson(Map<String, dynamic> map) {
    return FilterData(
      status: map['status'] != null ? map['status'] as bool : null,
      total_count:
          map['total_count'] != null ? map['total_count'] as int : null,
      attributes: map['attributes'] != null
          ? List<FilterAttributes>.from(
              (map['attributes'] as List<dynamic>).map<FilterAttributes?>(
                (x) => FilterAttributes.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
      data: map['data'] != null
          ? List<FilterProductDetails>.from(
              (map['data'] as List<dynamic>).map<FilterProductDetails?>(
                (x) => FilterProductDetails.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  @override
  String toString() {
    return 'FilterData(status: $status, total_count: $total_count, attributes: $attributes, )';
  }
}
