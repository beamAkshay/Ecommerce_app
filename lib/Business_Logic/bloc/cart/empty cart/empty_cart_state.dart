part of 'empty_cart_bloc.dart';

abstract class EmptyCartState extends Equatable {
  const EmptyCartState();

  @override
  List<Object> get props => [];
}

class EmptyCartInitial extends EmptyCartState {}

class EmptyCartLoading extends EmptyCartState {}

class EmptyCartLoaded extends EmptyCartState {}

class EmptyCartFailure extends EmptyCartState {
  final String message;
  const EmptyCartFailure(this.message);
}
