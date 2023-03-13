part of 'total_price_calculate_bloc.dart';

abstract class TotalPriceCalculateEvent extends Equatable {
  const TotalPriceCalculateEvent();

  @override
  List<Object> get props => [];
}

class CalculateTotalPrice extends TotalPriceCalculateEvent
{
  final Map<String,dynamic> totalPrice;
  const CalculateTotalPrice(this.totalPrice);

}