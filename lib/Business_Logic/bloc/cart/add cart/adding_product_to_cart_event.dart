part of 'adding_product_to_cart_bloc.dart';

abstract class AddingProductToCartEvent extends Equatable {
  const AddingProductToCartEvent();

  @override
  List<Object> get props => [];
}

class AddProductToCart extends AddingProductToCartEvent {
  final int productId;
  final String token;

  const AddProductToCart(this.productId, this.token);

  @override
  List<Object> get props => [productId, token];
}

class AddProductToLocalCartEvent extends AddingProductToCartEvent {
  final CartProductData cartProductData;
  const AddProductToLocalCartEvent(this.cartProductData);
  @override
  List<Object> get props => [cartProductData];
}
