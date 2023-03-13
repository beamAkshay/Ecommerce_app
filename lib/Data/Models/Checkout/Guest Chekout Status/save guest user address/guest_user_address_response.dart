// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class GuestUserAddressResponse {
  final bool? status;
  final String? order_number;
  GuestUserAddressResponse({
    this.status,
    this.order_number,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'order_number': order_number,
    };
  }

  factory GuestUserAddressResponse.fromJson(Map<String, dynamic> map) {
    return GuestUserAddressResponse(
      status: map['status'] != null ? map['status'] as bool : null,
      order_number:
          map['order_number'] != null ? map['order_number'] as String : null,
    );
  }

  @override
  String toString() =>
      'GuestUserAddressResponse(status: $status, order_number: $order_number)';
}
