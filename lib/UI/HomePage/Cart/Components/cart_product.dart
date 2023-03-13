import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/cart/total%20price%20calculate/total_price_calculate_bloc.dart';
import 'package:unicorn_store/Data/Models/Cart/View%20Cart/cart_product_data.dart';
import 'package:unicorn_store/Data/Repositories/cart/add_to_local_cart_repository.dart';
import 'package:unicorn_store/UI/HomePage/Components/price_tag.dart';
import '../../../../Business_Logic/bloc/cart/update/update_cart_item_quantity_bloc.dart';
import '../../../Components/default_snackbar.dart';
import '../../../Components/image_path.dart';
import '../../../size_config.dart';
import '../../../../constant/constant.dart';

class CartProduct extends StatefulWidget {
  final CartProductData cartProduct;
  final String token;
  final bool isAuthenticate;
  final int index;
  final Map<String, dynamic> totalPriceList;
  final ValueSetter<CartProductData> onPressed;
  final ValueSetter<CartProductData> addToWishlist;
  const CartProduct(
      {Key? key,
      required this.cartProduct,
      required this.addToWishlist,
      required this.totalPriceList,
      required this.index,
      required this.token,
      required this.isAuthenticate,
      required this.onPressed})
      : super(key: key);

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  String counter = "1";
  double? totalProductPrice;

  final TextEditingController _quantityController = TextEditingController();

  late UpdateCartItemQuantityBloc updateCartItemQuantityBloc;

  late TotalPriceCalculateBloc totalPriceCalculateBloc;

  @override
  void initState() {
    totalPriceCalculateBloc = BlocProvider.of<TotalPriceCalculateBloc>(context);
    updateCartItemQuantityBloc = UpdateCartItemQuantityBloc(
        RepositoryProvider.of<AddToLocalCartRepository>(context));
    counter = widget.cartProduct.item_quantity.toString();

    //calculate total price of product
    totalProductPrice = widget.cartProduct.price! * double.parse(counter);
    widget.totalPriceList[widget.cartProduct.id.toString()] = totalProductPrice;
    totalPriceCalculateBloc.add(CalculateTotalPrice(widget.totalPriceList));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => updateCartItemQuantityBloc,
      child:
          BlocListener<UpdateCartItemQuantityBloc, UpdateCartItemQuantityState>(
        listener: (context, state) {
          if (state is UpdateCartItemQuantitySuccess) {
            setState(() {
              totalProductPrice =
                  widget.cartProduct.price! * double.parse(counter);
              widget.totalPriceList[widget.cartProduct.id.toString()] =
                  totalProductPrice;
              totalPriceCalculateBloc
                  .add(CalculateTotalPrice(widget.totalPriceList));
            });
          }
          if (state is UpdateCartItemQuantityFailure) {
            ScaffoldMessenger.of(context).showSnackBar(defaultSnackBar(
                state.message,
                Theme.of(context).errorColor,
                Theme.of(context).colorScheme.onError,
                2000));
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Card(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(
                                  getProportionateScreenWidth(5.0)),
                              height: getProportionateScreenHeight(100.0),
                              width: getProportionateScreenWidth(100.0),
                              // decoration: BoxDecoration(
                              //     border: Border.all(color: kDefaultBorderColor)),
                              child: CachedNetworkImage(
                                  width: getProportionateScreenWidth(250.0),
                                  height: getProportionateScreenHeight(250.0),
                                  imageUrl:
                                      "$categoryImageUrl/product/medium/${ImagePath.getPrimaryImageSrc(widget.cartProduct.images!)}",
                                  placeholder: (context, url) => Container(),
                                  errorWidget: (context, url, error) =>
                                      const Image(
                                          image: AssetImage(errorImageUrl))),
                            ),
                            const SizedBox(
                              height: 10,
                            ), //Quantity
                            PopupMenuButton(
                              position: PopupMenuPosition.under,
                              offset: const Offset(10, 10),
                              onSelected: (String? sortingValue) {
                                if (sortingValue == " ") {
                                  showDialog<String?>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: const Text('Enter Quantity'),
                                            content: TextFormField(
                                              controller: _quantityController,
                                              keyboardType: const TextInputType
                                                  .numberWithOptions(
                                                decimal: false,
                                                signed: true,
                                              ),
                                              inputFormatters: <
                                                  TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                                LengthLimitingTextInputFormatter(
                                                  2,
                                                ),
                                              ],
                                              decoration: const InputDecoration(
                                                hintText: "Quantity",
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Cancel'),
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    counter =
                                                        _quantityController
                                                            .text;
                                                  });
                                                  updateCartItemQuantityBloc
                                                      .add(UpdateCartItem(
                                                          widget.cartProduct
                                                                  .cart_item_id ??
                                                              -1,
                                                          counter,
                                                          widget.token,
                                                          widget.isAuthenticate,
                                                          widget.cartProduct
                                                              .id!));
                                                  Navigator.pop(
                                                      context, 'Cancel');
                                                },
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          ));
                                } else {
                                  setState(() {
                                    counter = sortingValue!;
                                  });
                                  updateCartItemQuantityBloc.add(UpdateCartItem(
                                      widget.cartProduct.cart_item_id ?? -1,
                                      counter,
                                      widget.token,
                                      widget.isAuthenticate,
                                      widget.cartProduct.id!));
                                }
                              },
                              itemBuilder: (BuildContext context) => const [
                                PopupMenuItem(
                                  value: "1",
                                  child: Text('1'),
                                ),
                                PopupMenuItem(
                                  value: "2",
                                  child: Text('2'),
                                ),
                                PopupMenuItem(
                                  value: "3",
                                  child: Text('3'),
                                ),
                                PopupMenuItem(
                                  value: " ",
                                  child: Text('more...'),
                                ),
                              ],
                              child: Container(
                                height: 40,
                                width: 95,
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline)),
                                child: BlocBuilder<UpdateCartItemQuantityBloc,
                                    UpdateCartItemQuantityState>(
                                  builder: (context, state) {
                                    if (state
                                        is UpdateCartItemQuantityLoading) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 30.0),
                                        child: CircularProgressIndicator(
                                          strokeWidth: 3.0,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          backgroundColor: Colors.transparent,
                                        ),
                                      );
                                    }
                                    return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Qty: ",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onBackground
                                                      .withOpacity(0.8),
                                                  fontSize: 16.0)),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 2.0),
                                            child: Text(
                                              counter,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onBackground
                                                      .withOpacity(0.8),
                                                  fontSize: 16.0),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 2.0),
                                            child: Icon(
                                              Icons.arrow_drop_down,
                                              size: 25,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground
                                                  .withOpacity(0.8),
                                            ),
                                          ),
                                        ]);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(10.0),
                            vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.cartProduct.name ?? " ",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(15.0),
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  height: 1.5),
                            ),

                            //Price Tag
                            SizedBox(
                              height: getProportionateScreenHeight(15.0),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Price",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                PriceTag(
                                  price: widget.cartProduct.price!
                                      .floor()
                                      .toString(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            //Sub-Total
                            Row(
                              children: [
                                Text(
                                  "Sub-Total",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                PriceTag(
                                  price: totalProductPrice!.floor().toString(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                IntrinsicHeight(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.symmetric(
                            horizontal: BorderSide(
                                color: Theme.of(context).colorScheme.outline))),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton.icon(
                              onPressed: () {
                                widget.addToWishlist(widget.cartProduct);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.6),
                              ),
                              icon: const Icon(
                                Icons.favorite_sharp,
                              ),
                              label: const Text(
                                "Wishlist",
                              )),
                        ),
                        VerticalDivider(
                          color: Theme.of(context).colorScheme.outline,
                          indent: 5.0,
                          endIndent: 5.0,
                          thickness: 2,
                        ),
                        Expanded(
                          child: TextButton.icon(
                              onPressed: () {
                                widget.onPressed(widget.cartProduct);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.6),
                              ),
                              icon: const Icon(
                                Icons.delete_rounded,
                              ),
                              label: const Text(
                                "Remove",
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
