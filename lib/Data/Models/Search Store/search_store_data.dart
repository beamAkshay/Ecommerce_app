// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class SearchStoreData {
  final String? store_id;
  final String? store_name;
  final String? store_address;
  final String? store_contacts;
  SearchStoreData({
    this.store_id,
    this.store_name,
    this.store_address,
    this.store_contacts,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'store_id': store_id,
      'store_name': store_name,
      'store_address': store_address,
      'store_contacts': store_contacts,
    };
  }

  factory SearchStoreData.fromJson(Map<String, dynamic> map) {
    return SearchStoreData(
      store_id: map['store_id'] != null ? map['store_id'] as String : null,
      store_name: map['store_name'] != null ? map['store_name'] as String : null,
      store_address: map['store_address'] != null ? map['store_address'] as String : null,
      store_contacts: map['store_contacts'] != null ? map['store_contacts'] as String : null,
    );
  }

  @override
  String toString() {
    return 'SearchStoreData(store_id: $store_id, store_name: $store_name, store_address: $store_address, store_contacts: $store_contacts)';
  }
}
