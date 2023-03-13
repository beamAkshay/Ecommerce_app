// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'save_guest_user_cart_product_bloc.dart';

abstract class SaveGuestUserCartProductEvent extends Equatable {
  const SaveGuestUserCartProductEvent();

  @override
  List<Object> get props => [];
}

class SaveGuestUserCartProduct extends SaveGuestUserCartProductEvent {
  final SaveGuestUserProduct saveGuestUserProduct;
  final String token;
  const SaveGuestUserCartProduct(
    this.saveGuestUserProduct,
    this.token,
  );
}
