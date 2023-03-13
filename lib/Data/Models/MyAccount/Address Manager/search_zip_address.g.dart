// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_zip_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchZipAddress _$SearchZipAddressFromJson(Map<String, dynamic> json) =>
    SearchZipAddress(
      json['pincode'] as String?,
      json['divisionname'] as String?,
      json['statename'] as String?,
      json['state_id'] as String?,
      json['country_id'] as String?,
      json['country_name'] as String?,
      json['zip_required'] as String?,
    );

Map<String, dynamic> _$SearchZipAddressToJson(SearchZipAddress instance) =>
    <String, dynamic>{
      'pincode': instance.pincode,
      'divisionname': instance.divisionname,
      'statename': instance.statename,
      'state_id': instance.stateId,
      'country_id': instance.countryId,
      'country_name': instance.countryName,
      'zip_required': instance.zipRequired,
    };
