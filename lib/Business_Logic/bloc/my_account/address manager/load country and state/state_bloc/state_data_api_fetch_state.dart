part of 'state_data_api_fetch_bloc.dart';

abstract class StateDataApiFetchState extends Equatable {
  const StateDataApiFetchState();
  
  @override
  List<Object> get props => [];
}

class StateDataApiFetchInitial extends StateDataApiFetchState {}

class StateDataApiFetchLoading extends StateDataApiFetchState {}

class StateDataApiFetchLoaded extends StateDataApiFetchState {
  final StateList stateList;
  final bool eventChecker;
  const StateDataApiFetchLoaded(this.stateList,this.eventChecker);

}

class StateDataApiFetchError extends StateDataApiFetchState {
  final String? message;
  const StateDataApiFetchError(this.message);
}