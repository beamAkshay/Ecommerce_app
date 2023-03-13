part of 'update_cart_item_quantity_bloc.dart';

abstract class UpdateCartItemQuantityEvent extends Equatable {
  const UpdateCartItemQuantityEvent();

  @override
  List<Object> get props => [];
}

class UpdateCartItem extends UpdateCartItemQuantityEvent
{
  final int cartItemId;
  final String quantity;
  final String token;
  final bool isAuthenticate;
  final int productKey;

  const UpdateCartItem(this.cartItemId,this.quantity,this.token,this.isAuthenticate,this.productKey);

   @override
  List<Object> get props => [cartItemId,quantity,token,isAuthenticate];




}
