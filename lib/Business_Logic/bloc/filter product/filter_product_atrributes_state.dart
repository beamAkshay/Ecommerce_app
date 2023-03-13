part of 'filter_product_atrributes_bloc.dart';

abstract class FilterProductAtrributesState extends Equatable {
  const FilterProductAtrributesState();

  @override
  List<Object> get props => [];
}

class FilterProductAtrributesInitial extends FilterProductAtrributesState {}

class FilterProductAtrributesLoading extends FilterProductAtrributesState {}

class FilterProductAtrributesLoaded extends FilterProductAtrributesState {
  final FilterData filterData;
 final Map<String, bool> defaultFilterData;
  const FilterProductAtrributesLoaded(this.filterData,this.defaultFilterData);
}

class FilterProductAtrributesFailure extends FilterProductAtrributesState {
  final String message;
  const FilterProductAtrributesFailure(this.message);
}
