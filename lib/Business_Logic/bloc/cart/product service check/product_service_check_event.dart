part of 'product_service_check_bloc.dart';

abstract class ProductServiceCheckEvent extends Equatable {
  const ProductServiceCheckEvent();

  @override
  List<Object> get props => [];
}

class CheckProductService extends ProductServiceCheckEvent {
  final String pinCode;
  const CheckProductService(this.pinCode);

  @override
  List<Object> get props => [pinCode];
}
