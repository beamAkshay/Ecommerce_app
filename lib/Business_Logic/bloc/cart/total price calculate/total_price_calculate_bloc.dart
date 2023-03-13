import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'total_price_calculate_event.dart';
part 'total_price_calculate_state.dart';

class TotalPriceCalculateBloc
    extends Bloc<TotalPriceCalculateEvent, TotalPriceCalculateState> {
  TotalPriceCalculateBloc() : super(TotalPriceCalculateInitial()) {
    on<CalculateTotalPrice>((event, emit) {
      emit(TotalPriceCalculateLoading());

      final data = event.totalPrice;
      double totalPrice = 0.0;

      data.forEach((key, value) {
        totalPrice = totalPrice + value;
      });
      //print(event.totalPrice);

      emit(TotalPriceCalculateSuccess(totalPrice));
    });
  }
}
