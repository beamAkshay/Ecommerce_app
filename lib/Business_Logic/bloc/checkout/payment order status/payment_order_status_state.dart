part of 'payment_order_status_bloc.dart';

abstract class PaymentOrderStatusState extends Equatable {
  const PaymentOrderStatusState();

  @override
  List<Object> get props => [];
}

class PaymentOrderStatusInitial extends PaymentOrderStatusState {}

class PaymentOrderStatusLoading extends PaymentOrderStatusState {}

class PaymentOrderStatusPaid extends PaymentOrderStatusState {
  final PaymentModule paymentModule;
  const PaymentOrderStatusPaid(this.paymentModule);
}

class PaymentOrderStatusActive extends PaymentOrderStatusState {
  final PaymentModule paymentModule;
  const PaymentOrderStatusActive(this.paymentModule);
}

class PaymentOrderStatusFailure extends PaymentOrderStatusState {
  final String message;
  const PaymentOrderStatusFailure(this.message);
}
