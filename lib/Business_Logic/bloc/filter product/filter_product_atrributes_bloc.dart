import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unicorn_store/Data/Models/Filter/filter_data.dart';
import 'package:unicorn_store/Data/Repositories/product/filter_product_repository.dart';

part 'filter_product_atrributes_event.dart';
part 'filter_product_atrributes_state.dart';

class FilterProductAtrributesBloc
    extends Bloc<FilterProductAtrributesEvent, FilterProductAtrributesState> {
  final filterProductRepository = FilterProductRepository();
  FilterProductAtrributesBloc() : super(FilterProductAtrributesInitial()) {
    on<LoadFilterAttributes>((event, emit) async {
      try {
        emit(FilterProductAtrributesLoading());
        final filterDetails = await filterProductRepository.getFilterDetails(event.data,event.categorySlug);
         await Future.delayed(const Duration(seconds: 1));
        if (filterDetails.status!) {
          emit(FilterProductAtrributesLoaded(
              filterDetails, generateSelectedAttributeData(filterDetails)));
        } else {
          emit(
              const FilterProductAtrributesFailure("No Filter Data Available"));
        }
      } catch (e) {
        emit(FilterProductAtrributesFailure(e.toString()));
      }
    });
  }

  Map<String, bool> generateSelectedAttributeData(FilterData filterData) {
    Map<String, bool> a = {};
    for (int i = 0; i < filterData.attributes!.length; i++) {
      for (int j = 0;
          j < filterData.attributes![i].attribute_options!.length;
          j++) {
        a.addAll({
          filterData.attributes![i].attribute_options![j].id.toString(): false
        });
      }
    }
    return a;
  }
}
