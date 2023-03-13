import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/Filter/Filter%20Product%20Details/filter_product_info.dart';
import 'package:unicorn_store/Data/Repositories/product/filter_product_repository.dart';

part 'filter_single_product_details_event.dart';
part 'filter_single_product_details_state.dart';

class FilterSingleProductDetailsBloc extends Bloc<
    FilterSingleProductDetailsEvent, FilterSingleProductDetailsState> {
  FilterSingleProductDetailsBloc()
      : super(FilterSingleProductDetailsInitial()) {
    final filterProductRepository = FilterProductRepository();

    on<LoadFilterSingleProductDetails>((event, emit) async {
      try {
        emit(FilterSingleProductDetailsLoading());
        final filterSingleProductDetails = await filterProductRepository
            .getSingleFilterProductDetails(event.productSlug, event.token);

        await Future.delayed(const Duration(seconds: 1));
        if (filterSingleProductDetails.status!) {
          emit(FilterSingleProductDetailsLoaded(filterSingleProductDetails));
        } else {
          emit(const FilterSingleProductDetailsFailure(
              "No Product Info Available"));
        }
      } catch (e) {
        // print(e);
        emit(FilterSingleProductDetailsFailure(e.toString()));
      }
    });
  }
}
