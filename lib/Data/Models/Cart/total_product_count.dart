// ignore_for_file: public_member_api_docs, sort_constructors_first
class TotalProductCount {
  final bool? status;
  final int? message;
  
  TotalProductCount({
    this.status,
    this.message,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'message': message,
    };
  }

  factory TotalProductCount.fromJson(Map<String, dynamic> map) {
    return TotalProductCount(
      status: map['status'] != null ? map['status'] as bool : null,
      message: map['message'] != null ? map['message'] as int : null,
    );
  }

  @override
  String toString() => 'TotalProductCount(status: $status, message: $message)';
}
