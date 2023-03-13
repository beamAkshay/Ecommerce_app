part of 'product_page_details_bloc.dart';

abstract class ProductPageDetailsEvent extends Equatable {
  const ProductPageDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadProductDataBasedOnValueEvent extends ProductPageDetailsEvent {
  final List<dynamic> productValue;
  final String productTypeId;
  final String token;

  const LoadProductDataBasedOnValueEvent(
      {required this.productValue,
      required this.productTypeId,
      required this.token});

  @override
  List<Object> get props => [productValue, productTypeId];
}
