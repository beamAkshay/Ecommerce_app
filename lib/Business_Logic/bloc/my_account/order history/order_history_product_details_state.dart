part of 'order_history_product_details_bloc.dart';

abstract class OrderHistoryProductDetailsState extends Equatable {
  const OrderHistoryProductDetailsState();

  @override
  List<Object> get props => [];
}

class OrderHistoryProductDetailsInitial
    extends OrderHistoryProductDetailsState {}

class OrderHistoryProductDetailsLoading
    extends OrderHistoryProductDetailsState {}

class OrderHistoryProductDetailsLoaded extends OrderHistoryProductDetailsState {
  final OrderHistory orderHistory;

  const OrderHistoryProductDetailsLoaded(this.orderHistory);
}

class OrderHistoryProductDetailsError extends OrderHistoryProductDetailsState {
  final String? message;
  const OrderHistoryProductDetailsError(this.message);
}
