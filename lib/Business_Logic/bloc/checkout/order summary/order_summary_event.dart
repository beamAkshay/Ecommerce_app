part of 'order_summary_bloc.dart';

abstract class OrderSummaryEvent extends Equatable {
  const OrderSummaryEvent();

  @override
  List<Object> get props => [];
}

class LoadUserOrderSummary extends OrderSummaryEvent {
  final String token;
  const LoadUserOrderSummary(this.token);
}

class LoadUserCheckoutTotalProduct extends OrderSummaryEvent {
  final String token;
  const LoadUserCheckoutTotalProduct(this.token);
}
