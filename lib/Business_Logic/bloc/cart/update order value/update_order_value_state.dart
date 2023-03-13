part of 'update_order_value_bloc.dart';

abstract class UpdateOrderValueState extends Equatable {
  const UpdateOrderValueState();

  @override
  List<Object> get props => [];
}

class UpdateOrderValueInitial extends UpdateOrderValueState {}

class UpdateOrderValueLoading extends UpdateOrderValueState {}

class UpdateOrderValueLoaded extends UpdateOrderValueState {}

class UpdateOrderValueFailure extends UpdateOrderValueState {
  final String message;
  const UpdateOrderValueFailure(this.message);
}
