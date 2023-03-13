part of 'save_guest_user_cart_product_bloc.dart';

abstract class SaveGuestUserCartProductState extends Equatable {
  const SaveGuestUserCartProductState();

  @override
  List<Object> get props => [];
}

class SaveGuestUserCartProductInitial extends SaveGuestUserCartProductState {}

class SaveGuestUserCartProductLoading extends SaveGuestUserCartProductState {}

class SaveGuestUserCartProductLoaded extends SaveGuestUserCartProductState {
  final List<SaveGuestUserProductResponse> saveGuestUserProductResponse;
  const SaveGuestUserCartProductLoaded(this.saveGuestUserProductResponse);
}

class SaveGuestUserCartProductFailure extends SaveGuestUserCartProductState {
  final String message;
  const SaveGuestUserCartProductFailure(this.message);
}
