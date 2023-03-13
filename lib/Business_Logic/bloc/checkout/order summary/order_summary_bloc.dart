import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/Checkout/Order%20Summary/order_summary_data.dart';
import 'package:unicorn_store/Data/Repositories/checkout/checkout_repository.dart';

part 'order_summary_event.dart';
part 'order_summary_state.dart';

class OrderSummaryBloc extends Bloc<OrderSummaryEvent, OrderSummaryState> {
  final checkoutRepository = CheckoutRepository();
  OrderSummaryBloc() : super(OrderSummaryInitial()) {
    on<LoadUserOrderSummary>((event, emit) async {
      try {
        emit(OrderSummaryLoading());

        final orderSummaryData =
            await checkoutRepository.getUserOrderSummary(event.token);

        if (orderSummaryData.status!) {
          emit(OrderSummaryLoaded(orderSummaryData));
        } else {
          emit(const OrderSummaryFailure("No data Available"));
        }
      } catch (e) {
       // print(e);
        emit(OrderSummaryFailure(e.toString()));
      }
    });

    on<LoadUserCheckoutTotalProduct>((event, emit) async {
      try {
        emit(OrderSummaryLoading());

        final userCheckoutProductTotal =
            await checkoutRepository.getUserCheckoutProductTotal(event.token);

        if (userCheckoutProductTotal["status"]) {
          emit(OrderSummaryCheckoutUserTotal(userCheckoutProductTotal));
        } else {
          emit(const OrderSummaryFailure("No data Available"));
        }
      } catch (e) {
        // print(e);
        emit(OrderSummaryFailure(e.toString()));
      }
    });
  }
}
