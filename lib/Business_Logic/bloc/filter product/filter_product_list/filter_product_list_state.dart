part of 'filter_product_list_bloc.dart';

abstract class FilterProductListState extends Equatable {
  const FilterProductListState();

  @override
  List<Object> get props => [];
}

class FilterProductListInitial extends FilterProductListState {}

class FilterProductListLoading extends FilterProductListState {}

class FilterProductListClear extends FilterProductListState {}

class FilterProductListLoaded extends FilterProductListState {
  final FilterProductList filterProductList;
   final Map<String, dynamic> selectedAttributesData;
  final bool isNavigate;

  const FilterProductListLoaded(this.filterProductList,this.isNavigate,this.selectedAttributesData);
}

class FilterProductListFailure extends FilterProductListState {
  final String message;
  const FilterProductListFailure(this.message);
}
