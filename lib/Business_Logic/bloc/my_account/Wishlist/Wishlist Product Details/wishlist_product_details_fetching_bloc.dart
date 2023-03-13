import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Wishlist/product%20add%20or%20delete%20response/product_add_delete_response.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Wishlist/wishlist_details.dart';
import 'package:unicorn_store/Data/Repositories/my_account/Wishlist/wishlist_product_details_repository.dart';

part 'wishlist_product_details_fetching_event.dart';
part 'wishlist_product_details_fetching_state.dart';

class WishlistProductDetailsFetchingBloc extends Bloc<
    WishlistProductDetailsFetchingEvent, WishlistProductDetailsFetchingState> {
  WishlistProductDetailsFetchingBloc()
      : super(WishlistProductDetailsFetchingInitial()) {
    final WishlistProductDetailsRepository wishlistProductDetailsRepository =
        WishlistProductDetailsRepository();

    on<LoadWishlistProductDetailsApiFetch>((event, emit) async {
      try {
        emit(WishlistProductDetailsFetchingLoading());

        final wishlistProductDetails = await wishlistProductDetailsRepository
            .getWishlistProductDetails(event.token);

        await Future.delayed(const Duration(seconds: 2));
        if (wishlistProductDetails.status!) {
          emit(WishlistProductDetailsFetchingLoaded(wishlistProductDetails));
        } else {
          emit(const WishlistProductDetailsFetchingError(
              "No Products Added in Wishlist."));
        }
      } catch (e) {
        emit(WishlistProductDetailsFetchingError(e.toString()));
      }
    });

    on<AddOrDeleteProductFromWishlistEvent>((event, emit) async {
      try {
        emit(WishlistProductDetailsFetchingLoading());

        final addOrRemoveProductFromWishlist =
            await wishlistProductDetailsRepository.addOrDeleteWishlistProduct(
                event.productId, event.token);

        final wishlistProductDetails = await wishlistProductDetailsRepository
            .getWishlistProductDetails(event.token);

        if (wishlistProductDetails.status!) {
          emit(AddOrRemoveProductFromWishlistSuccess(
              addOrRemoveProductFromWishlist, wishlistProductDetails));
       
        } else {
             emit(const WishlistProductDetailsFetchingError(
              "No Products Added in Wishlist."));
          // emit(AddOrRemoveProductFromWishlistSuccess(
          //     addOrRemoveProductFromWishlist, wishlistProductDetails));
        }
      } catch (e) {
        emit(WishlistProductDetailsFetchingError(e.toString()));
      }
    });

    //Add product to wishlist event
    on<AddProductToWishlistEvent>((event, emit) async {
      try {
        emit(WishlistProductDetailsFetchingLoading());

        final addOrRemoveProductFromWishlist =
            await wishlistProductDetailsRepository.addProductToWishlist(
                event.productId, event.token);

        emit(AddProductToWishlistSuccess(addOrRemoveProductFromWishlist));
      } catch (e) {
        emit(WishlistProductDetailsFetchingError(e.toString()));
      }
    });
  }
}
