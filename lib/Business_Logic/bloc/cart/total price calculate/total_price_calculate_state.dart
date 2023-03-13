part of 'total_price_calculate_bloc.dart';

abstract class TotalPriceCalculateState extends Equatable {
  const TotalPriceCalculateState();
  
  @override
  List<Object> get props => [];
}

class TotalPriceCalculateInitial extends TotalPriceCalculateState {}

class TotalPriceCalculateLoading extends TotalPriceCalculateState {}

class TotalPriceCalculateSuccess extends TotalPriceCalculateState {
 
   final double totalPrice;
   const TotalPriceCalculateSuccess(this.totalPrice);

}


