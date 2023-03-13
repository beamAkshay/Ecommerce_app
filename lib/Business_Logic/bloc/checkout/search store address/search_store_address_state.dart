part of 'search_store_address_bloc.dart';

abstract class SearchStoreAddressState extends Equatable {
  const SearchStoreAddressState();

  @override
  List<Object> get props => [];
}

class SearchStoreAddressInitial extends SearchStoreAddressState {}

class SearchStoreAddressLoading extends SearchStoreAddressState {}

class SearchStoreAddressUpdateLoading extends SearchStoreAddressState {}

class SearchStoreAddressLoaded extends SearchStoreAddressState {
  final SearchStore searchStore;
  const SearchStoreAddressLoaded(this.searchStore);
}

class SearchStoreAddressUpdated extends SearchStoreAddressState {
  final Map<String, dynamic> searchStore;
  const SearchStoreAddressUpdated(this.searchStore);
}

class SearchStoreAddressUpdateFailure extends SearchStoreAddressState {
  final String message;
  const SearchStoreAddressUpdateFailure(this.message);
}

class SearchStoreAddressFailure extends SearchStoreAddressState {
  final String message;
  const SearchStoreAddressFailure(this.message);
}
