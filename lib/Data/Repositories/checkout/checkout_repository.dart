import 'package:unicorn_store/Data/Data_Providers/Checkout/checkout_api.dart';
import 'package:unicorn_store/Data/Models/Checkout/Order%20Summary/order_summary_data.dart';
import 'package:unicorn_store/Data/Models/Default%20Address/default__addreses_field_data.dart';
import 'package:unicorn_store/Data/Models/Default%20Address/default_address_data.dart';
import 'package:unicorn_store/Data/Models/Search%20Store/search_store.dart';

import '../../Models/Checkout/Guest Chekout Status/guest_checkout_status.dart';
import '../../Models/Checkout/Guest Chekout Status/save guest user address/guest_user_address.dart';
import '../../Models/Checkout/Guest Chekout Status/save guest user address/guest_user_address_response.dart';
import '../../Models/Checkout/Guest Chekout Status/save guest user product only/save_guest_user_product.dart';
import '../../Models/Checkout/Guest Chekout Status/save guest user product only/save_guest_user_product_response.dart';
import '../../Models/Checkout/Transaction/Payment Module Data/payment_module.dart';
import '../../Models/Checkout/Transaction/View Payment Module/view_payment_module.dart';
import '../../Models/Checkout/Transaction/View Payment Module/view_payment_module_data.dart';

class CheckoutRepository {
  final checkoutApi = CheckoutApi();

  Future<DefaultAddressData> getUserDefaultAddress(String token) {
    return checkoutApi.getUserDefaultAddress(token);
  }

  Future<Map<String, dynamic>> updateBillingAddress(
      DefaultAddressFieldData data, String token) {
    return checkoutApi.updateBillingAddress(data, token);
  }

  Future<SearchStore> searchStore(String city, String token) {
    return checkoutApi.searchStore(city, token);
  }

  Future<Map<String, dynamic>> updateShippingStoreAddress(
      String storeId, String token) {
    return checkoutApi.updateShippingStoreAddress(storeId, token);
  }

  Future<Map<String, dynamic>> updateShippingAddress(
      DefaultAddressFieldData data, String token) {
    return checkoutApi.updateShippingAddress(data, token);
  }

  Future<OrderSummaryData> getUserOrderSummary(String token) {
    return checkoutApi.getUserOrderSummary(token);
  }

  Future<Map<String, dynamic>> getUserCheckoutProductTotal(String token) {
    return checkoutApi.getUserCheckoutProductTotal(token);
  }

  //getting payment gateway details
  Future<ViewPaymentModule> getPaymentModuleDetails(String token) {
    return checkoutApi.getPaymentModuleDetails(token);
  }

  //getting particular payment module data
  Future<PaymentModule> getSpecificPaymentModuleData(
      ViewPaymentModuleData data, String token) {
    return checkoutApi.getSpecificPaymentModuleData(data, token);
  }

  Future<PaymentModule> getPaymentOrderStatus(String orderId, String token) {
    return checkoutApi.getPaymentOrderStatus(orderId, token);
  }

  //check status of guest checkout
  Future<GuestCheckoutStatus> guestCheckoutStatus() {
    return checkoutApi.guestCheckoutStatus();
  }

  Future<GuestUserAddressResponse> saveGuestUserAddress(
      GuestUserAddress guestUserAddress) {
    return checkoutApi.saveGuestUserAddress(guestUserAddress);
  }

  Future<List<SaveGuestUserProductResponse>> saveGuestUserProductData(
      SaveGuestUserProduct saveGuestUserProduct, String token) {
    return checkoutApi.saveGuestUserProductData(saveGuestUserProduct, token);
  }
}
