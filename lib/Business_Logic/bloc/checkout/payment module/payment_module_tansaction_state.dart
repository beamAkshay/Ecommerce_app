part of 'payment_module_tansaction_bloc.dart';

abstract class PaymentModuleTansactionState extends Equatable {
  const PaymentModuleTansactionState();

  @override
  List<Object> get props => [];
}

class PaymentModuleTansactionInitial extends PaymentModuleTansactionState {}

class PaymentModuleTansactionLoading extends PaymentModuleTansactionState {}

class PaymentModuleTansactionLoaded extends PaymentModuleTansactionState {
  final ViewPaymentModule viewPaymentModule;
  const PaymentModuleTansactionLoaded(this.viewPaymentModule);
}

class PaymentModuleTansactionFailure extends PaymentModuleTansactionState {
  final String message;
  const PaymentModuleTansactionFailure(this.message);
}

class PaymentModuleTansactionRedirectURLLoaded
    extends PaymentModuleTansactionState {
  final PaymentModule paymentModule;
  const PaymentModuleTansactionRedirectURLLoaded(this.paymentModule);
}

class PaymentModuleTansactionCashOnDeliverySuccess
    extends PaymentModuleTansactionState {
  final PaymentModule paymentModule;
  const PaymentModuleTansactionCashOnDeliverySuccess(this.paymentModule);
}


class PaymentModuleTansactionRedirectURLFailure
    extends PaymentModuleTansactionState {
  final String message;
  const PaymentModuleTansactionRedirectURLFailure(this.message);
}
