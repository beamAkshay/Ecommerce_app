// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'view_payment_module_data.dart';

class ViewPaymentModule {
  final bool? status;
  final List<ViewPaymentModuleData>? data;
  ViewPaymentModule({
    this.status,
    this.data,
  });

  
  @override
  String toString() => 'ViewPaymentModuleData(status: $status, data: $data)';

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'data': data!.map((x) => x.toJson()).toList(),
    };
  }

  factory ViewPaymentModule.fromJson(Map<String, dynamic> map) {
    return ViewPaymentModule(
      status: map['status'] != null ? map['status'] as bool : null,
      data: map['data'] != null ? List<ViewPaymentModuleData>.from((map['data'] as List<dynamic>).map<ViewPaymentModuleData?>((x) => ViewPaymentModuleData.fromJson(x as Map<String,dynamic>),),) : null,
    );
  }
}
