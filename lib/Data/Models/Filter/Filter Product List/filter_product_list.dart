// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names


import 'package:unicorn_store/Data/Models/Filter/Filter%20Product%20List/filter_product_details.dart';

class FilterProductList {
  final bool? status;
  final int? total_count;
  final List<FilterProductDetails>? data;

  FilterProductList(this.status, this.total_count, this.data);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'total_count': total_count,
      'data': data!.map((x) => x.toJson()).toList(),
    };
  }

  factory FilterProductList.fromJson(Map<String, dynamic> map) {
    return FilterProductList(
      map['status'] != null ? map['status'] as bool : null,
      map['total_count'] != null ? map['total_count'] as int : null,
      map['data'] != null
          ? List<FilterProductDetails>.from(
              (map['data'] as List<dynamic>).map<FilterProductDetails?>(
                (x) => FilterProductDetails.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  @override
  String toString() =>
      'FilterProductList(status: $status, total_count: $total_count, data: $data)';
}
