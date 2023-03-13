import 'package:hive_flutter/hive_flutter.dart';
import 'package:unicorn_store/Data/Models/Cart/View%20Cart/cart_product_data.dart';
import 'package:unicorn_store/Data/Models/Product/New%20Product/type_image.dart';

class AddToLocalCartRepository {
  late Box<CartProductData> _cartProductData;

  //Opening hive box
  Future<void> init() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(CartProductDataAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TypeImageAdapter());
    }

    _cartProductData =
        await Hive.openBox<CartProductData>('addingProductToLocalCart');
    // addingProductToLocalCart =
    //     await Hive.openBox<CartProductData>('addingProductToLocalCart');
  }

  Future<void> addProductToLocalCard(CartProductData productData) async {
    final serviceResponseData = _cartProductData.values
        .where((element) => element.id == productData.id)
        .toList();

    if (serviceResponseData.isNotEmpty) {
      serviceResponseData[0].item_quantity =
          serviceResponseData[0].item_quantity! + 1;
      serviceResponseData[0].save();
    } else {
      await _cartProductData.add(productData);
    }
  }

  Future<void> updateLocalCartProductQuantity(
      int productId, int itemQuantity) async {
    final taskToRemove = _cartProductData.values
        .firstWhere((element) => element.id == productId);
    taskToRemove.item_quantity = itemQuantity;
    taskToRemove.save();
  }

  int totalLocalCartProductCount() {
    final serviceResponseData = _cartProductData.values.toList();
    return serviceResponseData.length;
  }

  List<CartProductData> getAllLocalCartProduct() {
    final serviceResponseData = _cartProductData.values.toList();
    //   print("getting product from cart $serviceResponseData");
    return serviceResponseData;
  }

  //Deleting product from local cart
  Future<void> deleteProductFromLocalCart(int productId) async {
    final taskToRemove = _cartProductData.values
        .firstWhere((element) => element.id == productId);
    //  print(taskToRemove);
    await taskToRemove.delete();
  }

  void emptyLocalCart() {
    _cartProductData.clear();
  }
}
