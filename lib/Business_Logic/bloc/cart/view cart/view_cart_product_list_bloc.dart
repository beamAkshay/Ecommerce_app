import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/Cart/View%20Cart/cart_product_data.dart';
import 'package:unicorn_store/Data/Repositories/cart/add_to_cart_repository.dart';
import 'package:unicorn_store/Data/Repositories/cart/add_to_local_cart_repository.dart';
part 'view_cart_product_list_event.dart';
part 'view_cart_product_list_state.dart';

class ViewCartProductListBloc
    extends Bloc<ViewCartProductListEvent, ViewCartProductListState> {
  final AddToCartRepository addToCartRepository = AddToCartRepository();
  final AddToLocalCartRepository addToLocalCartRepository;
  ViewCartProductListBloc(this.addToLocalCartRepository)
      : super(ViewCartProductListInitial()) {
    on<LoadCartProductList>((event, emit) async {
      try {
        emit(ViewCartProductListLoading());

        if (event.isAuthenticated) {
          final productList =
              await addToCartRepository.viewCartProductList(event.token);
          if (productList.cart_items!.isNotEmpty) {
            emit(ViewCartProductListLoaded(productList.cart_items!));
          } else {
            emit(ViewCartProductListEmpty());
          }
        } else {
          // await addToLocalCartRepository.init();

          final productList = addToLocalCartRepository.getAllLocalCartProduct();
          await Future.delayed(const Duration(seconds: 1));

          //  addToLocalCartRepository.updateLocalCartProductQuantity(2,5);
          if (productList.isEmpty) {
            emit(ViewCartProductListEmpty());
          } else {
            emit(ViewLocalCartProductListLoaded(productList));
          }
        }
      } catch (e) {
        emit(ViewCartProductListFailure(e.toString()));
      }
    });
  }
}
