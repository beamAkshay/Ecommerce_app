import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/Service%20Check%20Pincode/pincode_service_check_data.dart';
import 'package:unicorn_store/Data/Repositories/cart/add_to_cart_repository.dart';

part 'product_service_check_event.dart';
part 'product_service_check_state.dart';

class ProductServiceCheckBloc
    extends Bloc<ProductServiceCheckEvent, ProductServiceCheckState> {
  AddToCartRepository addToCartRepository = AddToCartRepository();
  ProductServiceCheckBloc() : super(ProductServiceCheckInitial()) {
    on<CheckProductService>((event, emit) async {
      try {
        emit(ProductServiceCheckLoading());
        final serviceCheckResponse =
            await addToCartRepository.productServiceCheck(event.pinCode);
          await Future.delayed(const Duration(seconds: 1));
        if (serviceCheckResponse.status!) {        

          emit(ProductServiceCheckLoaded(serviceCheckResponse));
        } else {
          emit( ProductServiceCheckFailure(serviceCheckResponse.message!));
        }
      } catch (e) {

        emit(ProductServiceCheckFailure(e.toString()));
      }
    });
  }
}
