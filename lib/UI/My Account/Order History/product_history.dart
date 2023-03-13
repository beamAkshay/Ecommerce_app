import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/my_account/order%20history/order_history_product_details_bloc.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Login/login_data.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Order%20History/order_history.dart';
import 'package:unicorn_store/UI/Components/linear_indicator.dart';
import 'package:unicorn_store/UI/HomePage/Components/build_app_bar.dart';
import 'package:unicorn_store/UI/size_config.dart';

import '../../../constant/constant.dart';
import 'Components/order_history_item.dart';
import 'reviews_and_ratings.dart';

class ProductHistory extends StatefulWidget {
  static String id = "ProductHistory_Page";
  const ProductHistory({Key? key}) : super(key: key);

  @override
  State<ProductHistory> createState() => _ProductHistoryState();
}

class _ProductHistoryState extends State<ProductHistory> {
  //creating instace for wishlistbloc
  OrderHistoryProductDetailsBloc orderHistoryProductDetailsBloc =
      OrderHistoryProductDetailsBloc();

  // ignore: prefer_typing_uninitialized_variables
  var userLoginData;

  //getting logged in user details
  LoginData? loginData;

  @override
  void didChangeDependencies() {
    userLoginData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    loginData = userLoginData["loginData"];
    orderHistoryProductDetailsBloc
        .add(LoadOrderHistoryDetailsApiFetch(token: loginData!.userData!.token!));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BuildAppBar(),
      body: BlocProvider(
        create: (context) => orderHistoryProductDetailsBloc,
        child: BlocBuilder<OrderHistoryProductDetailsBloc,
            OrderHistoryProductDetailsState>(
          builder: (context, state) {

            if (state is OrderHistoryProductDetailsLoading) {
              return const LinearIndicatorBar();
            }
            else if(state is OrderHistoryProductDetailsLoaded){
               return _buildOrderHistory(context,state.orderHistory);     
            }
            return const Center(child: Text("No order history Available."),);

            

           
          },
        ),
      ),
    );
  }

  Widget _buildOrderHistory(BuildContext context,OrderHistory orderHistoryDetails) {
    return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenHeight(15.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ReviewAndRating.id);
                      },
                      child: Text("Order History",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(25.0),
                              color: kDefaultHeaderFontColor)),
                    ),
                    const Divider(
                      color: kDefaultBorderColor,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15.0),
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:orderHistoryDetails.data.length,
                        itemBuilder: (context, index) {
                          return OderHistoryItem(orderData: orderHistoryDetails.data[index],);
                        })
                  ],
                ),
              ),
            ),
          );
  }
}
