part of 'total_product_count_bloc.dart';

abstract class TotalProductCountEvent extends Equatable {
  const TotalProductCountEvent();

  @override
  List<Object> get props => [];
}

class LoadTotalCartProductCount extends TotalProductCountEvent {
  final String token;
  final bool isAuthenticate;
  const LoadTotalCartProductCount(this.token,this.isAuthenticate);
}
