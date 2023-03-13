import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/Checkout/Transaction/Payment%20Module%20Data/payment_module.dart';
import 'package:unicorn_store/Data/Repositories/checkout/checkout_repository.dart';
part 'payment_order_status_event.dart';
part 'payment_order_status_state.dart';

class PaymentOrderStatusBloc
    extends Bloc<PaymentOrderStatusEvent, PaymentOrderStatusState> {
  final checkoutRepository = CheckoutRepository();
  PaymentOrderStatusBloc() : super(PaymentOrderStatusInitial()) {
    on<LoadPaymentOrderStatus>((event, emit) async {
      try {
        emit(PaymentOrderStatusLoading());
        final paymentStatusData = await checkoutRepository
            .getPaymentOrderStatus(event.orderId, event.token);
        if (paymentStatusData.status!) {
          if (paymentStatusData.data!.order_status == "PAID") {
            emit(PaymentOrderStatusPaid(paymentStatusData));
          } else if (paymentStatusData.data!.order_status == "ACTIVE") {
            emit(PaymentOrderStatusActive(paymentStatusData));
          }
        } else {
          emit(const PaymentOrderStatusFailure(
              "Failed to check payment status"));
        }
      } catch (e) {
        emit(PaymentOrderStatusFailure(e.toString()));
      }
    });
  }
}
