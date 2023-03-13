// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class DefaultAddressFieldData {
  final String? firstname;
  final String? lastname;
  final String? email;
  final int? phone;
  final String? address1;
  final String? address2;
  final String? city;
  final int? zip;
  final String? country;
  final String? country_code;
  final int? country_id;
  final int? zone_id;
  final String? zone;
  DefaultAddressFieldData({
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.address1,
    this.address2,
    this.city,
    this.zip,
    this.country,
    this.country_code,
    this.country_id,
    this.zone_id,
    this.zone,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'phone': phone,
      'address1': address1,
      'address2': address2,
      'city': city,
      'zip': zip,
      'country': country,
      'country_code': country_code,
      'country_id': country_id,
      'zone_id': zone_id,
      'zone': zone,
    };
  }

  factory DefaultAddressFieldData.fromJson(Map<String, dynamic> map) {
    return DefaultAddressFieldData(
      firstname: map['firstname'] != null ? map['firstname'] as String : null,
      lastname: map['lastname'] != null ? map['lastname'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as int : null,
      address1: map['address1'] != null ? map['address1'] as String : null,
      address2: map['address2'] != null ? map['address2'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      zip: map['zip'] != null ? map['zip'] as int : null,
      country: map['country'] != null ? map['country'] as String : null,
      country_code:
          map['country_code'] != null ? map['country_code'] as String : null,
      country_id: map['country_id'] != null ? map['country_id'] as int : null,
      zone_id: map['zone_id'] != null ? map['zone_id'] as int : null,
      zone: map['zone'] != null ? map['zone'] as String : null,
    );
  }

  @override
  String toString() {
    return 'DefaultAddressFieldData(firstname: $firstname, lastname: $lastname, email: $email, phone: $phone, address1: $address1, address2: $address2, city: $city, zip: $zip, country: $country, country_code: $country_code, country_id: $country_id, zone_id: $zone_id, zone: $zone)';
  }
}
