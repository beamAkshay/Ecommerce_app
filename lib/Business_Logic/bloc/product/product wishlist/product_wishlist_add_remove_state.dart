part of 'product_wishlist_add_remove_bloc.dart';

abstract class ProductWishlistAddRemoveState extends Equatable {
  const ProductWishlistAddRemoveState();

  @override
  List<Object> get props => [];
}

class ProductWishlistAddRemoveInitial extends ProductWishlistAddRemoveState {}

class ProductWishlistAddRemoveLoading extends ProductWishlistAddRemoveState {}

class ProductWishlistAddRemoveLoaded extends ProductWishlistAddRemoveState {
  final ProductAddDeleteResponse? productAddDeleteResponse;
  const ProductWishlistAddRemoveLoaded(this.productAddDeleteResponse);
}

class ProductWishlistAddRemoveFailure extends ProductWishlistAddRemoveState {
  final String message;
  const ProductWishlistAddRemoveFailure(this.message);
}
