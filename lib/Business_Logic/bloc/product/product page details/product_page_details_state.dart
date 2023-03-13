part of 'product_page_details_bloc.dart';

abstract class ProductPageDetailsState extends Equatable {
  const ProductPageDetailsState();

  @override
  List<Object> get props => [];
}

class ProductPageDetailsInitial extends ProductPageDetailsState {}

class ProductPageDetailsLoading extends ProductPageDetailsState {}

class ProductPageDetailsLoaded extends ProductPageDetailsState {
  final SingleProductData productPageDetail;
  final List<dynamic> productValue;

  const ProductPageDetailsLoaded(this.productPageDetail, this.productValue);
}

class ProductPageDetailsError extends ProductPageDetailsState {
  final String? message;
  const ProductPageDetailsError(this.message);
}
