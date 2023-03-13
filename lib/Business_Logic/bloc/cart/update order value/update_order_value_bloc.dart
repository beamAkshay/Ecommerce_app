// ignore_for_file: unused_local_variable

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Data/Repositories/cart/add_to_cart_repository.dart';

part 'update_order_value_event.dart';
part 'update_order_value_state.dart';

class UpdateOrderValueBloc
    extends Bloc<UpdateOrderValueEvent, UpdateOrderValueState> {
  AddToCartRepository addToCartRepository = AddToCartRepository();

  UpdateOrderValueBloc() : super(UpdateOrderValueInitial()) {
    on<UpdateOrderValue>((event, emit) async {
      try {
        emit(UpdateOrderValueLoading());

        final removeResponse =
            await addToCartRepository.updateOrderValue(event.token);
        emit(UpdateOrderValueLoaded());
      } catch (e) {
        emit(UpdateOrderValueFailure(e.toString()));
      }
    });
  }
}
