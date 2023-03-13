part of 'payment_order_status_bloc.dart';

abstract class PaymentOrderStatusEvent extends Equatable {
  const PaymentOrderStatusEvent();

  @override
  List<Object> get props => [];
}

class LoadPaymentOrderStatus extends PaymentOrderStatusEvent {
  final String token;
  final String orderId;
  const LoadPaymentOrderStatus(this.orderId, this.token);
}
