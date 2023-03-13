import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Order%20History/order_history.dart';
import 'package:unicorn_store/Data/Repositories/my_account/Order%20History/order_history_product_details_repository.dart';

part 'order_history_product_details_event.dart';
part 'order_history_product_details_state.dart';

class OrderHistoryProductDetailsBloc extends Bloc<
    OrderHistoryProductDetailsEvent, OrderHistoryProductDetailsState> {
  OrderHistoryProductDetailsBloc()
      : super(OrderHistoryProductDetailsInitial()) {
    final OrderHistoryProductDetailsRepository
        orderHistoryProductDetailsRepository =
        OrderHistoryProductDetailsRepository();

    on<LoadOrderHistoryDetailsApiFetch>((event, emit) async {
      try {
        emit(OrderHistoryProductDetailsLoading());
        final orderHistoy = await orderHistoryProductDetailsRepository
            .getOrderHistoryProductDetails(event.token);
        await Future.delayed(const Duration(seconds: 1));
        if (orderHistoy.status!) {
          emit(OrderHistoryProductDetailsLoaded(orderHistoy));
        } else {
          emit(const OrderHistoryProductDetailsError(
              "No Order History Available"));
        }
      } catch (e) {
       // print(e);
        emit(OrderHistoryProductDetailsError(e.toString()));
      }
    });
  }
}
