import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/Product/New%20Product/single_product_data.dart';
import 'package:unicorn_store/Data/Repositories/product/product_details_repository.dart';

part 'product_page_details_event.dart';
part 'product_page_details_state.dart';

class ProductPageDetailsBloc
    extends Bloc<ProductPageDetailsEvent, ProductPageDetailsState> {
  final ProductDetailsRepository productDetailsRepository =
      ProductDetailsRepository();

  ProductPageDetailsBloc() : super(ProductPageDetailsInitial()) {
    on<LoadProductDataBasedOnValueEvent>((event, emit) async {
      try {
        emit(ProductPageDetailsLoading());
        final productPageDetails =
            await productDetailsRepository.getProductPageDetails(
                event.productValue, event.productTypeId, event.token);
        print('############################## $productPageDetails');
        await Future.delayed(const Duration(seconds: 2));
        if (productPageDetails.status!) {
          emit(
              ProductPageDetailsLoaded(productPageDetails, event.productValue));
        } else {
          emit(const ProductPageDetailsError("No product available"));
        }
      } catch (e) {
        print(e);
        emit(ProductPageDetailsError(e.toString()));
      }
    });
  }
}
