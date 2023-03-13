part of 'order_history_product_details_bloc.dart';

abstract class OrderHistoryProductDetailsEvent extends Equatable {
  const OrderHistoryProductDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadOrderHistoryDetailsApiFetch extends OrderHistoryProductDetailsEvent {

  final String token;

  const LoadOrderHistoryDetailsApiFetch({required this.token});

  @override
  List<Object> get props => [token];
}
