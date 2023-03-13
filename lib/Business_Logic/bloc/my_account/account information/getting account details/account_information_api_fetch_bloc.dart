import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Account%20Information/account_info_details.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Account%20Information/address_details.dart';
import 'package:unicorn_store/Data/Repositories/my_account/Account%20Information/account_information_details_repository.dart';

part 'account_information_api_fetch_event.dart';
part 'account_information_api_fetch_state.dart';

class AccountInformationApiFetchBloc extends Bloc<
    AccountInformationApiFetchEvent, AccountInformationApiFetchState> {
  AccountInformationApiFetchBloc()
      : super(AccountInformationApiFetchInitial()) {
    final AccountInformationDetailsRepository accountInformationRepository =
        AccountInformationDetailsRepository();

    on<LoadAccountDetailsApiFetch>((event, emit) async {
      try {
        emit(AccountInformationApiFetchLoading());
        final accountDetails = await accountInformationRepository
            .getAccountDetails( event.token);
        await Future.delayed(const Duration(seconds: 2));
        emit(AccountInformationApiFetchLoaded(accountDetails));
      } catch (e) {
        emit(AccountInformationApiFetchError(e.toString()));
      }
    });

    //Updating Customer Address
    on<UpdateCustomerAccountDetailsEvent>((event, emit) async {
      try {
        emit(AccountInformationApiFetchLoading());

        final updateUserAddressResponse =
            await accountInformationRepository.updateUserAccountInformation(event.token,event.addressData);
        await Future.delayed(const Duration(seconds: 2));

        emit(UpdateCustomerAccountDetailsSuccess(updateUserAddressResponse));
      } catch (e) {
        emit(AccountInformationApiFetchError(e.toString()));
      }
    });
  }
}
