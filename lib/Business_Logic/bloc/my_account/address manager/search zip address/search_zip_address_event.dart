part of 'search_zip_address_bloc.dart';

abstract class SearchZipAddressEvent extends Equatable {
  const SearchZipAddressEvent();

  @override
  List<Object> get props => [];
}

class LoadSearchZipAddress extends SearchZipAddressEvent {
  final String pincode;
  final String token;

  const LoadSearchZipAddress({required this.pincode,required this.token});

  @override
  List<Object> get props => [pincode,token];
}
