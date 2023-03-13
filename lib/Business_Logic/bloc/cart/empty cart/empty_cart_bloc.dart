// ignore_for_file: unused_local_variable

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Repositories/cart/add_to_cart_repository.dart';

part 'empty_cart_event.dart';
part 'empty_cart_state.dart';

class EmptyCartBloc extends Bloc<EmptyCartEvent, EmptyCartState> {
  AddToCartRepository addToCartRepository = AddToCartRepository();

  EmptyCartBloc() : super(EmptyCartInitial()) {
    on<EmptyCart>((event, emit) async {
      try {
        emit(EmptyCartLoading());

        final removeResponse = await addToCartRepository.emptyCart(event.token);
        emit(EmptyCartLoaded());
      } catch (e) {
        emit(EmptyCartFailure(e.toString()));
      }
    });
  }
}
