import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/Checkout/Transaction/Payment%20Module%20Data/payment_module.dart';
import 'package:unicorn_store/Data/Models/Checkout/Transaction/View%20Payment%20Module/view_payment_module.dart';
import 'package:unicorn_store/Data/Models/Checkout/Transaction/View%20Payment%20Module/view_payment_module_data.dart';
import 'package:unicorn_store/Data/Repositories/checkout/checkout_repository.dart';

part 'payment_module_tansaction_event.dart';
part 'payment_module_tansaction_state.dart';

class PaymentModuleTansactionBloc
    extends Bloc<PaymentModuleTansactionEvent, PaymentModuleTansactionState> {
  final checkoutRepository = CheckoutRepository();
  PaymentModuleTansactionBloc() : super(PaymentModuleTansactionInitial()) {
    on<LoadPaymentModuleDetails>((event, emit) async {
      try {
        emit(PaymentModuleTansactionLoading());
        final viewPaymentModuleData =
            await checkoutRepository.getPaymentModuleDetails(event.token);
        if (viewPaymentModuleData.status!) {
          emit(PaymentModuleTansactionLoaded(viewPaymentModuleData));
        } else {
          emit(const PaymentModuleTansactionFailure(
              "Payment Module Details is not available"));
        }
      } catch (e) {
        emit(PaymentModuleTansactionFailure(e.toString()));
      }
    });

    on<LoadParticularPaymentModuleData>((event, emit) async {
      try {
        emit(PaymentModuleTansactionLoading());
        final particularPaymentModuleData =
            await checkoutRepository.getSpecificPaymentModuleData(
                event.viewPaymentModuleData, event.token);
     //   print(particularPaymentModuleData);
        if (particularPaymentModuleData.status!) {
      //    print(particularPaymentModuleData.data!.payment_link);
          if (particularPaymentModuleData.data != null) {
       //     print(particularPaymentModuleData.data!.payment_link);
            emit(PaymentModuleTansactionRedirectURLLoaded(
                particularPaymentModuleData));
          } else {
            emit(PaymentModuleTansactionCashOnDeliverySuccess(
                particularPaymentModuleData));
          }
        } else {
          emit(const PaymentModuleTansactionRedirectURLFailure(
              "Something went wrong"));
        }
      } catch (e) {
        emit(PaymentModuleTansactionRedirectURLFailure(e.toString()));
      }
    });
  }
}
