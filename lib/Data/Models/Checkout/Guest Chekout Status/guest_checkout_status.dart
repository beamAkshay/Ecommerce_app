// ignore_for_file: public_member_api_docs, sort_constructors_first
class GuestCheckoutStatus {
   final bool status;
   final int data;
  GuestCheckoutStatus({
    required this.status,
    required this.data,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'data': data,
    };
  }

  factory GuestCheckoutStatus.fromJson(Map<String, dynamic> map) {
    return GuestCheckoutStatus(
      status: (map['status'] ?? false) as bool,
      data: (map['data'] ?? 0) as int,
    );
  }
}

