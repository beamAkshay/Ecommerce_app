part of 'filter_product_atrributes_bloc.dart';

abstract class FilterProductAtrributesEvent extends Equatable {
  const FilterProductAtrributesEvent();

  @override
  List<Object> get props => [];
}

class LoadFilterAttributes extends FilterProductAtrributesEvent
{
  final String categorySlug;
  final Map<String,dynamic> data;
   
   const LoadFilterAttributes(this.data,this.categorySlug);

}
