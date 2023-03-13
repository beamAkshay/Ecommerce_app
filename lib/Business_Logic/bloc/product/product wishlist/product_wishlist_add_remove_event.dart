part of 'product_wishlist_add_remove_bloc.dart';

abstract class ProductWishlistAddRemoveEvent extends Equatable {
  const ProductWishlistAddRemoveEvent();

  @override
  List<Object> get props => [];
}

class AddRemoveProductWishlist extends ProductWishlistAddRemoveEvent {
  final String productId;
  final String token;

  const AddRemoveProductWishlist(this.productId, this.token);
}
