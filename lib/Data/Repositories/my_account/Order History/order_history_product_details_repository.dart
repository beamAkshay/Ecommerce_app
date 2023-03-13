import 'package:unicorn_store/Data/Data_Providers/My%20Account/Order%20History/order_history_product_details_api.dart';

import '../../../Models/MyAccount/Order History/order_history.dart';

class OrderHistoryProductDetailsRepository {
  final _orderHistoryProductDetailsApi = OrderHistoryProductDetailsApi();

  //Load List of user order
  Future<OrderHistory> getOrderHistoryProductDetails(String token) {
    return _orderHistoryProductDetailsApi.getOrderHistoryProductDetails(token);
  }
}
