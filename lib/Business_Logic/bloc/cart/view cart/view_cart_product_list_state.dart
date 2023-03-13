part of 'view_cart_product_list_bloc.dart';

abstract class ViewCartProductListState extends Equatable {
  const ViewCartProductListState();

  @override
  List<Object> get props => [];
}

class ViewCartProductListInitial extends ViewCartProductListState {}

class ViewCartProductListLoading extends ViewCartProductListState {}

class ViewCartProductListLoaded extends ViewCartProductListState {
  final List<CartProductData> cartProductData;

  const ViewCartProductListLoaded(this.cartProductData);
}

class ViewLocalCartProductListLoaded extends ViewCartProductListState {
  final List<CartProductData> cartProductData;

  const ViewLocalCartProductListLoaded(this.cartProductData);
}
 
class ViewCartProductListEmpty extends ViewCartProductListState {}


class ViewCartProductListFailure extends ViewCartProductListState {
  final String message;

  const ViewCartProductListFailure(this.message);
}
