part of 'search_zip_address_bloc.dart';

abstract class SearchZipAddressState extends Equatable {
  const SearchZipAddressState();

  @override
  List<Object> get props => [];
}

class SearchZipAddressInitial extends SearchZipAddressState {}

class SearchZipAddressLoading extends SearchZipAddressState {}

class SearchZipAddressLoaded extends SearchZipAddressState {
  final SearchZipAddress searchAddressList;

  const SearchZipAddressLoaded(this.searchAddressList);
}

class SearchZipAddressError extends SearchZipAddressState {
  final String? message;
  const SearchZipAddressError(this.message);
}
