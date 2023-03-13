import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/State/state_list.dart';
import 'package:unicorn_store/Data/Repositories/my_account/Address%20Manager/address_manager_details_repository.dart';

part 'state_data_api_fetch_event.dart';
part 'state_data_api_fetch_state.dart';

class StateDataApiFetchBloc
    extends Bloc<StateDataApiFetchEvent, StateDataApiFetchState> {
  StateDataApiFetchBloc() : super(StateDataApiFetchInitial()) {
    final AddressManagerDetailsRepository addressManagerDetailsRepository =
        AddressManagerDetailsRepository();

    on<LoadStateData>((event, emit) async {
      try {
        emit(StateDataApiFetchLoading());
        final stateList = await addressManagerDetailsRepository
            .getStateList(event.countryID,event.token);
        emit(StateDataApiFetchLoaded(stateList,event.eventChecker));
      } catch (e) {
        emit(StateDataApiFetchError(e.toString()));
      }
    });
  }
}
