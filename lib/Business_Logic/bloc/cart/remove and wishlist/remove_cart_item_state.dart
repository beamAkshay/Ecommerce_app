part of 'remove_cart_item_bloc.dart';

abstract class RemoveCartItemState extends Equatable {
  const RemoveCartItemState();

  @override
  List<Object> get props => [];
}

class RemoveCartItemInitial extends RemoveCartItemState {}

class RemoveCartItemLoading extends RemoveCartItemState {}

class RemoveCartItemSuccess extends RemoveCartItemState {
  final Map<String, dynamic> removeResponse;
  final int productIndex;
  final CartProductData cartProductData;
  final bool isAuthenticate;

  const RemoveCartItemSuccess(this.removeResponse, this.productIndex,
      this.cartProductData, this.isAuthenticate);
}

class MoveToWishlistProductSuccess extends RemoveCartItemState {
  final Map<String, dynamic> removeResponse;
  final CartProductData cartProductData;

  const MoveToWishlistProductSuccess(this.removeResponse, this.cartProductData);
}

class RemoveCartItemFailure extends RemoveCartItemState {
  final String message;
  const RemoveCartItemFailure(this.message);
}
