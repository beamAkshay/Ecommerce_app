// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class PinCodeServiceCheck {
  final bool? status;
  final String? message;
  final String? TAT;
  PinCodeServiceCheck({
    this.status,
    this.message,
    this.TAT,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'TAT': TAT,
    };
  }

  factory PinCodeServiceCheck.fromJson(Map<String, dynamic> map) {
    return PinCodeServiceCheck(
      status: map['status'] != null ? map['status'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
      TAT: map['TAT'] != null ? map['TAT'] as String : null,
    );
  }

  @override
  String toString() => 'PinCodeServiceCheck(status: $status, message: $message, TAT: $TAT)';
}
