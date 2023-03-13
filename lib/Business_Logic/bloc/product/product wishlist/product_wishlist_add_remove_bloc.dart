import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../Data/Models/MyAccount/Wishlist/product add or delete response/product_add_delete_response.dart';
import '../../../../Data/Repositories/my_account/Wishlist/wishlist_product_details_repository.dart';

part 'product_wishlist_add_remove_event.dart';
part 'product_wishlist_add_remove_state.dart';

class ProductWishlistAddRemoveBloc
    extends Bloc<ProductWishlistAddRemoveEvent, ProductWishlistAddRemoveState> {
  final WishlistProductDetailsRepository wishlistProductDetailsRepository =
      WishlistProductDetailsRepository();

  ProductWishlistAddRemoveBloc() : super(ProductWishlistAddRemoveInitial()) {
    on<AddRemoveProductWishlist>((event, emit) async {
      try {
        emit(ProductWishlistAddRemoveLoading());

        final addOrRemoveProductFromWishlist =
            await wishlistProductDetailsRepository.addOrDeleteWishlistProduct(
                event.productId, event.token);

        if (addOrRemoveProductFromWishlist.status!) {
          emit(ProductWishlistAddRemoveLoaded(addOrRemoveProductFromWishlist));
        } else {
          emit(ProductWishlistAddRemoveFailure(
              addOrRemoveProductFromWishlist.message!));
        }
      } catch (e) {
        emit(ProductWishlistAddRemoveFailure(e.toString()));
      }
    });
  }
}
