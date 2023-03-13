import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Repositories/cart/add_to_cart_repository.dart';
import 'package:unicorn_store/Data/Repositories/cart/add_to_local_cart_repository.dart';

part 'update_cart_item_quantity_event.dart';
part 'update_cart_item_quantity_state.dart';

class UpdateCartItemQuantityBloc
    extends Bloc<UpdateCartItemQuantityEvent, UpdateCartItemQuantityState> {
  AddToCartRepository addToCartRepository = AddToCartRepository();
  final AddToLocalCartRepository addToLocalCartRepository ;
  UpdateCartItemQuantityBloc(this.addToLocalCartRepository) : super(UpdateCartItemQuantityInitial()) {
    on<UpdateCartItem>((event, emit) async {
      try {
        emit(UpdateCartItemQuantityLoading());

        if (event.isAuthenticate) {
          final updatedReponse = await addToCartRepository.updateCartItem(
              event.cartItemId, event.quantity, event.token);
          await Future.delayed(const Duration(seconds: 1));
          if (updatedReponse["status"]) {
            emit(UpdateCartItemQuantitySuccess(updatedReponse));
          } else {
            emit(const UpdateCartItemQuantityFailure("Product not Updated"));
          }
        } else {
         // await addToLocalCartRepository.init();
          await addToLocalCartRepository.updateLocalCartProductQuantity(
              event.productKey, int.parse(event.quantity));
          await Future.delayed(const Duration(seconds: 1));

          emit(const UpdateCartItemQuantitySuccess({}));
        }
      } catch (e) {
       // print(e);
        emit(UpdateCartItemQuantityFailure(e.toString()));
      }
    });
  }
}
