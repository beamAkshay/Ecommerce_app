part of 'filter_single_product_details_bloc.dart';

abstract class FilterSingleProductDetailsState extends Equatable {
  const FilterSingleProductDetailsState();

  @override
  List<Object> get props => [];
}

class FilterSingleProductDetailsInitial
    extends FilterSingleProductDetailsState {}

class FilterSingleProductDetailsLoading
    extends FilterSingleProductDetailsState {}

class FilterSingleProductDetailsLoaded extends FilterSingleProductDetailsState {
  final FilterProductInfo? filterProductInfo;

  const FilterSingleProductDetailsLoaded(this.filterProductInfo);
}

class FilterSingleProductDetailsFailure extends FilterSingleProductDetailsState {
  final String? message;

  const FilterSingleProductDetailsFailure(this.message);
}
