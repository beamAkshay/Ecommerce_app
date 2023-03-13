part of 'product_details_api_fetch_bloc.dart';

abstract class ProductDetailsApiFetchEvent extends Equatable {
  const ProductDetailsApiFetchEvent();

  @override
  List<Object> get props => [];
}

class LoadProductDetailsApiFetch extends ProductDetailsApiFetchEvent {
  final String productNameSlug;

  const LoadProductDetailsApiFetch({
    required this.productNameSlug,
  });

  @override
  List<Object> get props => [productNameSlug];
}
