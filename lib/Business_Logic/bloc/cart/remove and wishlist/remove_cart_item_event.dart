part of 'remove_cart_item_bloc.dart';

abstract class RemoveCartItemEvent extends Equatable {
  const RemoveCartItemEvent();

  @override
  List<Object> get props => [];
}

class RemoveItemCart extends RemoveCartItemEvent {
  final int cartItemId;
  final String token;
  final bool isAuthenticate;
  final int productId;
  final int productIndex;
  final CartProductData cartProductData;
  const RemoveItemCart(this.cartItemId, this.token, this.isAuthenticate,
      this.productId, this.productIndex, this.cartProductData);
  @override
  List<Object> get props => [cartItemId, token];
}

class MoveToWishlistCartItem extends RemoveCartItemEvent {
  final int cartItemId;
  final String token;
  final CartProductData cartProductData;

  const MoveToWishlistCartItem(
      this.cartItemId, this.token, this.cartProductData);
  @override
  List<Object> get props => [cartItemId, token];
}
