part of 'update_order_value_bloc.dart';

abstract class UpdateOrderValueEvent extends Equatable {
  const UpdateOrderValueEvent();

  @override
  List<Object> get props => [];
}

class UpdateOrderValue extends UpdateOrderValueEvent {
  final String token;
  const UpdateOrderValue(this.token);
}
