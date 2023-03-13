// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:unicorn_store/Data/Models/Search%20Store/search_store_data.dart';

class SearchStore {
  final bool? status;
  final List<SearchStoreData>? data;
  SearchStore({
    this.status,
    this.data,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'data': data!.map((x) => x.toJson()).toList(),
    };
  }

  factory SearchStore.fromJson(Map<String, dynamic> map) {
    return SearchStore(
      status: map['status'] != null ? map['status'] as bool : null,
      data: map['data'] != null ? List<SearchStoreData>.from((map['data'] as List<dynamic>).map<SearchStoreData?>((x) => SearchStoreData.fromJson(x as Map<String,dynamic>),),) : null,
    );
  }

  @override
  String toString() => 'SearchStore(status: $status, data: $data)';
}
