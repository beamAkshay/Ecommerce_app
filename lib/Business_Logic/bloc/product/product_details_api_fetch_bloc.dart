import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/Product/New%20Product%20Type/product_info_data.dart';
import 'package:unicorn_store/Data/Models/Product/Product%20Page/product_page_details.dart';
import 'package:unicorn_store/Data/Repositories/product/product_details_repository.dart';

part 'product_details_api_fetch_event.dart';
part 'product_details_api_fetch_state.dart';

class ProductDetailsApiFetchBloc
    extends Bloc<ProductDetailsApiFetchEvent, ProductDetailsApiFetchState> {
  ProductDetailsApiFetchBloc() : super(ProductDetailsApiFetchInitial()) {
    final ProductDetailsRepository productDetailsRepository =
        ProductDetailsRepository();

    on<LoadProductDetailsApiFetch>((event, emit) async {
      try {
        emit(ProductDetailsApiFetchLoading());
        final productDetails = await productDetailsRepository
            .getProductDetails(event.productNameSlug);
        await Future.delayed(const Duration(seconds: 2));
        if (productDetails.status!) {
          emit(ProductDetailsApiFetchLoaded(productDetails));
        } else {
          emit(const ProductDetailsApiFetchError("Something went wrong!"));
        }
      } catch (e) {
        emit(ProductDetailsApiFetchError(e.toString()));
      }
    });
  }
}
