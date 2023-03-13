import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Repositories/product/filter_product_repository.dart';

import '../../../../Data/Models/Filter/Filter Product List/filter_product_list.dart';
part 'filter_product_list_event.dart';
part 'filter_product_list_state.dart';

class FilterProductListBloc
    extends Bloc<FilterProductListEvent, FilterProductListState> {
  final filterProductRepository = FilterProductRepository();

  FilterProductListBloc() : super(FilterProductListInitial()) {
    on<LoadFilterProductList>((event, emit) async {
      try {
        emit(FilterProductListLoading());
        final filterDetails =
            await filterProductRepository.getFilterProductDetails(
                event.selectedAttributesData, event.categorySlug);
        // await Future.delayed(const Duration(seconds: 1));
        if (filterDetails.status!) {
          emit(FilterProductListLoaded(
              filterDetails, event.isNavigate, event.selectedAttributesData));
        } else {
          emit(const FilterProductListFailure("No Filter Product Available"));
        }
      } catch (e) {
        emit(FilterProductListFailure(e.toString()));
      }
    });

    on<ClearFilterProductList>((event, emit) {
      emit(FilterProductListClear());
    });
  }
}
