

part of 'product_details_api_fetch_bloc.dart';

abstract class ProductDetailsApiFetchState extends Equatable {
  const ProductDetailsApiFetchState();
  
  @override
  List<Object> get props => [];
}

class ProductDetailsApiFetchInitial extends ProductDetailsApiFetchState {}

class ProductDetailsApiFetchLoading extends ProductDetailsApiFetchState {}

class ProductDetailsApiFetchLoaded extends ProductDetailsApiFetchState {
  final ProductInfoData productTypeDetails;

  const ProductDetailsApiFetchLoaded(this.productTypeDetails);
}

class ProductPageDetailsApiFetchLoaded extends ProductDetailsApiFetchState {
  final ProductPageDetail productPageDetail;

  const ProductPageDetailsApiFetchLoaded(this.productPageDetail);
}

class ProductDetailsApiFetchError extends ProductDetailsApiFetchState {
  final String? message;
  const ProductDetailsApiFetchError(this.message);
}
