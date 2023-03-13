part of 'empty_cart_bloc.dart';

abstract class EmptyCartEvent extends Equatable {
  const EmptyCartEvent();

  @override
  List<Object> get props => [];
}

class EmptyCart extends EmptyCartEvent {
  final String token;
  const EmptyCart(this.token);
}
