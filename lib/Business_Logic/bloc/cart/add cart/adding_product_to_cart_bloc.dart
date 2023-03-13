import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/Cart/View%20Cart/cart_product_data.dart';
import 'package:unicorn_store/Data/Repositories/cart/add_to_cart_repository.dart';
import 'package:unicorn_store/Data/Repositories/cart/add_to_local_cart_repository.dart';
import '../../../../Data/Models/Cart/Add Product To Cart/adding_product_to_cart.dart';
part 'adding_product_to_cart_event.dart';
part 'adding_product_to_cart_state.dart';

class AddingProductToCartBloc
    extends Bloc<AddingProductToCartEvent, AddingProductToCartState> {
  final AddToCartRepository addToCartRepository = AddToCartRepository();
  final AddToLocalCartRepository addToLocalCartRepository;
  AddingProductToCartBloc(this.addToLocalCartRepository)
      : super(AddingProductToCartInitial()) {
    on<AddProductToCart>((event, emit) async {
      try {
        emit(AddingProductToCartLoading());
        final addToCart = await addToCartRepository.addProductToCart(
            event.productId, event.token);
        await Future.delayed(const Duration(seconds: 1));
        if (addToCart.status!) {
          emit(AddingProductToCartLoaded(addToCart, event.productId));
        } else {
          emit(AddingProductToCartFailure(addToCart.message!));
        }
      } catch (e) {
        emit(AddingProductToCartFailure(e.toString()));
      }
    });

    on<AddProductToLocalCartEvent>((event, emit) async {
      try {
        emit(AddingProductToCartLoading());
        await addToLocalCartRepository
            .addProductToLocalCard(event.cartProductData);
        await Future.delayed(const Duration(seconds: 1));
        AddingProductToCart addingProductToCart = AddingProductToCart();
        emit(AddingProductToCartLoaded(addingProductToCart, 0));
      } catch (e) {
        //  print(e);
        emit(AddingProductToCartFailure(e.toString()));
      }
    });
  }
}
