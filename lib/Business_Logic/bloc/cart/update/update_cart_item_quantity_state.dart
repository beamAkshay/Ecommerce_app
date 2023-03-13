part of 'update_cart_item_quantity_bloc.dart';

abstract class UpdateCartItemQuantityState extends Equatable {
  const UpdateCartItemQuantityState();

  @override
  List<Object> get props => [];
}

class UpdateCartItemQuantityInitial extends UpdateCartItemQuantityState {}

class UpdateCartItemQuantityLoading extends UpdateCartItemQuantityState {}

class UpdateCartItemQuantitySuccess extends UpdateCartItemQuantityState {
  final Map<String, dynamic> updatedProductResponse;
  const UpdateCartItemQuantitySuccess(this.updatedProductResponse);
}

class UpdateCartItemQuantityFailure extends UpdateCartItemQuantityState {
  final String message;
  const UpdateCartItemQuantityFailure(this.message);
}
