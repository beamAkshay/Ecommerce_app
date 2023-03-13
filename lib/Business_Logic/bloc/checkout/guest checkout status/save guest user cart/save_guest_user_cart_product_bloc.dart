import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/Checkout/Guest%20Chekout%20Status/save%20guest%20user%20product%20only/save_guest_user_product.dart';
import 'package:unicorn_store/Data/Models/Checkout/Guest%20Chekout%20Status/save%20guest%20user%20product%20only/save_guest_user_product_response.dart';
import 'package:unicorn_store/Data/Repositories/checkout/checkout_repository.dart';

part 'save_guest_user_cart_product_event.dart';
part 'save_guest_user_cart_product_state.dart';

class SaveGuestUserCartProductBloc
    extends Bloc<SaveGuestUserCartProductEvent, SaveGuestUserCartProductState> {
  CheckoutRepository checkoutRepository = CheckoutRepository();
  SaveGuestUserCartProductBloc() : super(SaveGuestUserCartProductInitial()) {
    on<SaveGuestUserCartProduct>((event, emit) async {
      try {
        emit(SaveGuestUserCartProductLoading());
        final saveGuestUserProductData = await checkoutRepository
            .saveGuestUserProductData(event.saveGuestUserProduct, event.token);
        emit(SaveGuestUserCartProductLoaded(saveGuestUserProductData));
      } catch (e) {
        emit(SaveGuestUserCartProductFailure(e.toString()));
      }
    });
  }
}
