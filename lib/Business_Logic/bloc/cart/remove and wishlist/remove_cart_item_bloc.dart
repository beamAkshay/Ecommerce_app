import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/Cart/View%20Cart/cart_product_data.dart';
import 'package:unicorn_store/Data/Repositories/cart/add_to_cart_repository.dart';
import 'package:unicorn_store/Data/Repositories/cart/add_to_local_cart_repository.dart';

part 'remove_cart_item_event.dart';
part 'remove_cart_item_state.dart';

class RemoveCartItemBloc
    extends Bloc<RemoveCartItemEvent, RemoveCartItemState> {
  AddToCartRepository addToCartRepository = AddToCartRepository();
  final AddToLocalCartRepository addToLocalCartRepository;
  RemoveCartItemBloc(this.addToLocalCartRepository)
      : super(RemoveCartItemInitial()) {
    on<RemoveItemCart>(
      (event, emit) async {
        try {
          emit(RemoveCartItemLoading());

          if (event.isAuthenticate) {
            final removeResponse = await addToCartRepository.removeCartItem(
                event.cartItemId, event.token);
            await Future.delayed(const Duration(seconds: 1));
            if (removeResponse["success"]) {
              emit(RemoveCartItemSuccess(removeResponse, event.productIndex,
                  event.cartProductData, true));
            } else {
              emit(const RemoveCartItemFailure("Failed to Remove Product"));
            }
          } else {
            await Future.delayed(const Duration(seconds: 1));

            await addToLocalCartRepository
                .deleteProductFromLocalCart(event.productId);
            emit(RemoveCartItemSuccess(
                const {}, event.productIndex, event.cartProductData, false));
          }
        } catch (e) {
          emit(RemoveCartItemFailure(e.toString()));
        }
      },
    );
    on<MoveToWishlistCartItem>(
      (event, emit) async {
        try {
          emit(RemoveCartItemLoading());
          final removeResponse = await addToCartRepository
              .moveToWishlistCartItem(event.cartItemId, event.token);
          await Future.delayed(const Duration(seconds: 1));
          if (removeResponse["success"]) {
            emit(MoveToWishlistProductSuccess(
                removeResponse, event.cartProductData));
          } else {
            emit(const RemoveCartItemFailure("Failed add product to wishlist"));
          }
        } catch (e) {
          emit(RemoveCartItemFailure(e.toString()));
        }
      },
    );
  }
}
