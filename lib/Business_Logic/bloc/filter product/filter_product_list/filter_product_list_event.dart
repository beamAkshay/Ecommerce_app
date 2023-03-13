part of 'filter_product_list_bloc.dart';

abstract class FilterProductListEvent extends Equatable {
  const FilterProductListEvent();

  @override
  List<Object> get props => [];
}

class LoadFilterProductList extends FilterProductListEvent {
  final Map<String, dynamic> selectedAttributesData;
  final bool isNavigate;
  final String categorySlug;
  const LoadFilterProductList(
      this.selectedAttributesData, this.isNavigate, this.categorySlug);
}

class ClearFilterProductList extends FilterProductListEvent {
  const ClearFilterProductList();
}
