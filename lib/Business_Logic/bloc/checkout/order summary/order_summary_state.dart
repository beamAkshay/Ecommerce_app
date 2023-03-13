part of 'order_summary_bloc.dart';

abstract class OrderSummaryState extends Equatable {
  const OrderSummaryState();

  @override
  List<Object> get props => [];
}

class OrderSummaryInitial extends OrderSummaryState {}

class OrderSummaryLoading extends OrderSummaryState {}

class OrderSummaryLoaded extends OrderSummaryState {
  final OrderSummaryData orderSummaryData;
  const OrderSummaryLoaded(this.orderSummaryData);
}

class OrderSummaryCheckoutUserTotal extends OrderSummaryState {
  final Map<String,dynamic> userCheckoutTotal;
  const OrderSummaryCheckoutUserTotal(this.userCheckoutTotal);
}

class OrderSummaryFailure extends OrderSummaryState {
  final String message;
  const OrderSummaryFailure(this.message);
}
