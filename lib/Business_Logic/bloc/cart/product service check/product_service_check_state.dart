part of 'product_service_check_bloc.dart';

abstract class ProductServiceCheckState extends Equatable {
  const ProductServiceCheckState();

  @override
  List<Object> get props => [];
}

class ProductServiceCheckInitial extends ProductServiceCheckState {}

class ProductServiceCheckLoading extends ProductServiceCheckState {}

class ProductServiceCheckLoaded extends ProductServiceCheckState {
  final PinCodeServiceCheck pinCodeServiceCheck;
  const ProductServiceCheckLoaded(this.pinCodeServiceCheck);
}

class ProductServiceCheckFailure extends ProductServiceCheckState {
  final String message;
  const ProductServiceCheckFailure(this.message);
}
