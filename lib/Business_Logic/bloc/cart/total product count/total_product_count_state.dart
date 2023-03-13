part of 'total_product_count_bloc.dart';

abstract class TotalProductCountState extends Equatable {
  const TotalProductCountState();

  @override
  List<Object> get props => [];
}

class TotalProductCountInitial extends TotalProductCountState {}

class TotalProductCountLoading extends TotalProductCountState {}

class TotalProductCountLoaded extends TotalProductCountState {
  final TotalProductCount totalProductCount;

  const TotalProductCountLoaded(this.totalProductCount);
}

class TotalProductCountFailure extends TotalProductCountState {
  final String message;
  const TotalProductCountFailure(this.message);
}
