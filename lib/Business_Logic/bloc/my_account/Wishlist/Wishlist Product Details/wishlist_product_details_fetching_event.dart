part of 'wishlist_product_details_fetching_bloc.dart';

abstract class WishlistProductDetailsFetchingEvent extends Equatable {
  const WishlistProductDetailsFetchingEvent();

  @override
  List<Object> get props => [];
}

class LoadWishlistProductDetailsApiFetch
    extends WishlistProductDetailsFetchingEvent {
 
  final String token;

  const LoadWishlistProductDetailsApiFetch(
      { required this.token});

  @override
  List<Object> get props => [token];
}

class AddOrDeleteProductFromWishlistEvent
    extends WishlistProductDetailsFetchingEvent {
 
  final String productId;
  final String token;

  const AddOrDeleteProductFromWishlistEvent(
      { required this.productId, required this.token});

  @override
  List<Object> get props => [ productId, token];
}

//This event only insert product to wishlist
class AddProductToWishlistEvent
    extends WishlistProductDetailsFetchingEvent {
 
  final String productId;
  final String token;

  const AddProductToWishlistEvent(
      { required this.productId, required this.token});

  @override
  List<Object> get props => [ productId, token];
}
