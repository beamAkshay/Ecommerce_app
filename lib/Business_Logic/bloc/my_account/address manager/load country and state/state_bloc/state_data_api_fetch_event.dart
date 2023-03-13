part of 'state_data_api_fetch_bloc.dart';

abstract class StateDataApiFetchEvent extends Equatable {
  const StateDataApiFetchEvent();

  @override
  List<Object> get props => [];
}

class LoadStateData extends StateDataApiFetchEvent {
  final String countryID;
  final String token;
  final bool eventChecker;

  const LoadStateData({required this.countryID,required this.token,required this.eventChecker});

   @override
  List<Object> get props => [countryID,token];




}
