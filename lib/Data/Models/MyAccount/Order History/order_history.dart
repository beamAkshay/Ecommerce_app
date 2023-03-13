// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:unicorn_store/Data/Models/MyAccount/Order%20History/order_history_data.dart';

class OrderHistory {
  final bool? status;
  final List<OrderHistoryData> data;

  OrderHistory(this.status, this.data);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'data': data.map((x) => x.toJson()).toList(),
    };
  }

  factory OrderHistory.fromJson(Map<String, dynamic> map) {
    return OrderHistory(
      map['status'] != null ? map['status'] as bool : null,
      List<OrderHistoryData>.from((map['data'] as List<dynamic>).map<OrderHistoryData>((x) => OrderHistoryData.fromJson(x as Map<String,dynamic>),),),
    );
  }

  @override
  String toString() => 'OrderHistory(status: $status, data: $data)';
}
