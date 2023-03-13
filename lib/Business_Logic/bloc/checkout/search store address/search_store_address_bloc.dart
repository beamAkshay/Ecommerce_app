import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/Search%20Store/search_store.dart';
import 'package:unicorn_store/Data/Repositories/checkout/checkout_repository.dart';

part 'search_store_address_event.dart';
part 'search_store_address_state.dart';

class SearchStoreAddressBloc
    extends Bloc<SearchStoreAddressEvent, SearchStoreAddressState> {
  final checkoutRepository = CheckoutRepository();
  SearchStoreAddressBloc() : super(SearchStoreAddressInitial()) {
    on<LoadStoreAddress>((event, emit) async {
      try {
        emit(SearchStoreAddressLoading());
        final storeData =
            await checkoutRepository.searchStore(event.city, event.token);
        await Future.delayed(const Duration(seconds: 1));
        if (storeData.status!) {
          emit(SearchStoreAddressLoaded(storeData));
        } else {
          emit(const SearchStoreAddressFailure("Store data are not available"));
        }
      } catch (e) {
        emit(SearchStoreAddressFailure(e.toString()));
      }
    });

    on<UpdateShippingStoreAddress>((event, emit) async {
      try {
        emit(SearchStoreAddressUpdateLoading());
        final updatedStoreData = await checkoutRepository
            .updateShippingStoreAddress(event.storeId, event.token);
        await Future.delayed(const Duration(seconds: 1));
        if (updatedStoreData["status"]) {
          emit(SearchStoreAddressUpdated(updatedStoreData));
        } else {
          emit(const SearchStoreAddressUpdateFailure(
              "Store address is not updated"));
        }
      } catch (e) {
      //  print(e);
        emit(SearchStoreAddressUpdateFailure(e.toString()));
      }
    });
  }
}
