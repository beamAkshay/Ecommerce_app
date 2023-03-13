part of 'search_store_address_bloc.dart';

abstract class SearchStoreAddressEvent extends Equatable {
  const SearchStoreAddressEvent();

  @override
  List<Object> get props => [];
}

class LoadStoreAddress extends SearchStoreAddressEvent {
  final String token;
  final String city;
  const LoadStoreAddress(this.city, this.token);

  @override
  List<Object> get props => [token, city];
}

class UpdateShippingStoreAddress extends SearchStoreAddressEvent {
  final String storeId;
  final String token;

  const UpdateShippingStoreAddress(this.storeId, this.token);
}
