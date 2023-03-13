// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

class ViewPaymentModuleData {
  final int? p_id;
  final String? pg_name;
  final int? c_id;
  final String? client_name;

  ViewPaymentModuleData(this.p_id, this.pg_name, this.c_id, this.client_name);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'p_id': p_id,
      'pg_name': pg_name,
      'c_id': c_id,
      'client_name': client_name,
    };
  }

  factory ViewPaymentModuleData.fromJson(Map<String, dynamic> map) {
    return ViewPaymentModuleData(
      map['p_id'] != null ? map['p_id'] as int : null,
      map['pg_name'] != null ? map['pg_name'] as String : null,
      map['c_id'] != null ? map['c_id'] as int : null,
      map['client_name'] != null ? map['client_name'] as String : null,
    );
  }

  @override
  String toString() {
    return 'ViewPaymentModuleData(p_id: $p_id, pg_name: $pg_name, c_id: $c_id, client_name: $client_name)';
  }
}
