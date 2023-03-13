part of 'payment_module_tansaction_bloc.dart';

abstract class PaymentModuleTansactionEvent extends Equatable {
  const PaymentModuleTansactionEvent();

  @override
  List<Object> get props => [];
}

class LoadPaymentModuleDetails extends PaymentModuleTansactionEvent {
  final String token;
  const LoadPaymentModuleDetails(this.token);
}

class LoadParticularPaymentModuleData extends PaymentModuleTansactionEvent {
  final String token;
  final ViewPaymentModuleData viewPaymentModuleData;

  const LoadParticularPaymentModuleData(this.token, this.viewPaymentModuleData);
}
