// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iphone_has_notch/iphone_has_notch.dart';

import 'package:unicorn_store/Business_Logic/bloc/filter%20product/filter_product_atrributes_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/filter%20product/filter_product_list/filter_product_list_bloc.dart';
import 'package:unicorn_store/Data/Models/Filter/filter_attributes_options.dart';
import 'package:unicorn_store/Data/Models/Filter/filter_data.dart';
import 'package:unicorn_store/UI/Components/linear_indicator.dart';
import 'package:unicorn_store/UI/Components/loading_indicator_bar.dart';
import 'package:unicorn_store/UI/ProductCategories/Category%201/list_of_specific_product.dart';
import 'package:unicorn_store/UI/size_config.dart';

class SelectAttributes {
  String? attribute_type;
  List<int>? attribute_options;

  SelectAttributes(this.attribute_type, this.attribute_options);

  Map<String, dynamic> toMap() {
    return {
      'attribute_type': attribute_type,
      'attribute_options': attribute_options,
    };
  }

  @override
  String toString() =>
      'SelectAttributes(attribute_type: $attribute_type, attribute_options: $attribute_options)';
}

class FilterScreen extends StatefulWidget {
  final Map<String, bool>? selectedAttributeValue;
  final List<SelectAttributes>? checkedAttribute;
  final Map<String, int>? selectedItemList;
  final String? categorySlug;
  final String? totalCount;
  const FilterScreen(
      {Key? key,
      this.selectedAttributeValue,
      this.totalCount,
      this.categorySlug,
      this.checkedAttribute,
      this.selectedItemList})
      : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int selectedIndex = 0;

  FilterData? filterData;

  List<Map<String, bool>> test = [];

  //Creating instance for filter bloc
  FilterProductAtrributesBloc filterProductAtrributesBloc =
      FilterProductAtrributesBloc();
  FilterProductListBloc filterProductListBloc = FilterProductListBloc();

  //This map for check or uncheck checkbox value
  Map<String, bool> selectedAttributeValue = {};

  //This is for stored checked attributes count
  List<SelectAttributes> data = [];

  //This list for count checked attributes
  List<SelectAttributes> checkedAttribute = [];
  Map<String, int> selectedItemList = {};

  String? totalCount;

  bool isProgress = false;

  @override
  void initState() {
    selectedAttributeValue = widget.selectedAttributeValue ?? {};
    checkedAttribute = widget.checkedAttribute ?? [];
    selectedItemList = widget.selectedItemList ?? {};
    totalCount = widget.totalCount ?? "0";
    super.initState();
  }

  Map<String, int> generateSelectedAttributeCount(FilterData filterData) {
    Map<String, int> a = {};

    for (int i = 0; i < filterData.attributes!.length; i++) {
      a.addAll({
        filterData.attributes![i].attribute_label!:
            checkedAttribute[i].attribute_options!.length
      });
    }

    return a;
  }

  List<int> generateSelectedAttributeId(Map<String, bool> data) {
    List<int> a = [];

    data.forEach((key, value) {
      if (value) {
        a.add(int.parse(key));
      }
    });
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => filterProductAtrributesBloc
            ..add(LoadFilterAttributes(const {
              "limit_per_page": "100",
              "order_by": "name",
              "skip": "0",
              "sort": "0",
              "filter_text": ""
            }, widget.categorySlug!)),
        ),
        BlocProvider(
          create: (context) => filterProductListBloc,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Filters",
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAttributeValue.clear();
                    data = List.generate(filterData!.attributes!.length,
                        (index) => SelectAttributes(null, []));
                    checkedAttribute = List.generate(
                        filterData!.attributes!.length,
                        (index) => SelectAttributes(null, []));

                    selectedItemList.clear();
                  });
                  filterProductListBloc.add(const ClearFilterProductList());
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Clear Filters",
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                )),
            const SizedBox(width: 15.0)
          ],
        ),
        body: BlocListener<FilterProductListBloc, FilterProductListState>(
          listener: (context, state) {
            if (state is FilterProductListLoading) {
              setState(() {
                isProgress = true;
              });
            }
            if (state is FilterProductListLoaded) {
              if (state.isNavigate) {
                Navigator.pushReplacementNamed(
                    context, ListOfSpecificProduct.id,
                    arguments: {
                      "filterProductList": state.filterProductList,
                      "selectedAttributeData": state.selectedAttributesData,
                      "selectedCheckboxAttributes": selectedAttributeValue,
                      "checkedAttribute": checkedAttribute,
                      "selectedItemList": selectedItemList,
                      "categorySlug": widget.categorySlug,
                      "homeScreen": false,
                    });
              } else {
                setState(() {
                  isProgress = false;
                });
              }
            }
            if (state is FilterProductListFailure) {
              setState(() {
                isProgress = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 2),
              ));
            }
          },
          child: BlocConsumer<FilterProductAtrributesBloc,
              FilterProductAtrributesState>(
            listener: (context, state) {
              if (state is FilterProductAtrributesLoaded) {
                setState(() {
                  filterData = state.filterData;
                  totalCount = (totalCount == "0")
                      ? filterData!.total_count.toString()
                      : widget.totalCount;
                  if (selectedAttributeValue.isEmpty) {
                    // print("YESSSSSSSSSSSSSSSSSSSSS");
                    selectedAttributeValue = state.defaultFilterData;
                    checkedAttribute = List.generate(
                        filterData!.attributes!.length,
                        (index) => SelectAttributes(null, []));
                  }

                  data = List.generate(filterData!.attributes!.length,
                      (index) => SelectAttributes(null, []));
                });
              }
            },
            builder: (context, state) {
              if (state is FilterProductAtrributesLoading) {
                return const LinearIndicatorBar();
              }
              if (state is FilterProductAtrributesLoaded) {
                filterData = state.filterData;
                return SafeArea(
                  bottom: false,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 4,
                            child: Container(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              child: ListView.builder(
                                  itemCount: filterData!.attributes!.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                          // selectedItemList[selectedIndex] =
                                          //     checkedAttribute[selectedIndex]
                                          //         .attribute_options!
                                          //         .length;
                                          selectedItemList.addAll({
                                            filterData!.attributes![index]
                                                    .attribute_label!:
                                                checkedAttribute[selectedIndex]
                                                    .attribute_options!
                                                    .length
                                          });
                                          selectedItemList =
                                              generateSelectedAttributeCount(
                                                  filterData!);
                                          data[0].attribute_type =
                                              "multiselect";
                                          data[0].attribute_options =
                                              generateSelectedAttributeId(
                                                  selectedAttributeValue);
                                        });

                                        List<Map<String, dynamic>>
                                            selectedData =
                                            List<Map<String, dynamic>>.from(
                                                data.map((e) => e.toMap()));
                                        // selectedData.removeWhere((element) =>
                                        //     element["attribute_type"] == null);

                                        if (filterData!.attributes!.length >
                                            1) {
                                          selectedData.removeAt(1);
                                        }

                                        Map<String, dynamic> finalData = {
                                          "limit_per_page": "100",
                                          "order_by": "count",
                                          "skip": "0",
                                          "sort": "0",
                                          "filter_text": "",
                                          "attributes": selectedData
                                        };
                                        filterProductListBloc.add(
                                            LoadFilterProductList(finalData,
                                                false, widget.categorySlug!));
                                      },
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 5.0),
                                        height: 60,
                                        color: selectedIndex == index
                                            ? Theme.of(context)
                                                .colorScheme
                                                .onPrimaryContainer
                                            : Theme.of(context)
                                                .colorScheme
                                                .primaryContainer,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                filterData!.attributes![index]
                                                    .attribute_label!,
                                                textAlign: TextAlign.left,
                                                maxLines: 3,
                                                style: TextStyle(
                                                    color: (selectedIndex ==
                                                            index)
                                                        ? Theme.of(context)
                                                            .colorScheme
                                                            .secondary
                                                        : Theme.of(context)
                                                            .colorScheme
                                                            .onSurface
                                                            .withOpacity(0.8),
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Text(
                                              (selectedItemList[filterData!
                                                              .attributes![
                                                                  index]
                                                              .attribute_label!] !=
                                                          null &&
                                                      selectedItemList[filterData!
                                                              .attributes![
                                                                  index]
                                                              .attribute_label!] !=
                                                          0)
                                                  ? selectedItemList[filterData!
                                                          .attributes![index]
                                                          .attribute_label!]
                                                      .toString()
                                                  : " ",
                                              textAlign: TextAlign.left,
                                              maxLines: 3,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          Flexible(
                            flex: 7,
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 5.0),
                              child: ListView.builder(
                                  itemCount: filterData!
                                      .attributes![selectedIndex]
                                      .attribute_options!
                                      .length,
                                  itemBuilder: (context, index) {
                                    FilterAttributesOptions attributesOption =
                                        filterData!.attributes![selectedIndex]
                                            .attribute_options![index];

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 0.0),
                                      child: Material(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        child: CheckboxListTile(
                                          dense: true,
                                          value: selectedAttributeValue[
                                                  attributesOption.id
                                                      .toString()] ??
                                              false,
                                          title: Text(
                                            attributesOption.option_name!,
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface),
                                          ),
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          onChanged: (value) {
                                            if (value!) {
                                              setState(() {
                                                // data[0].attribute_type =
                                                //     attributesOption
                                                //         .attribute_type;

                                                // data[0]
                                                //     .attribute_options!.add(attributesOption.id!);

                                                //This is for getting checked attributes list
                                                checkedAttribute[selectedIndex]
                                                    .attribute_options!
                                                    .add(attributesOption.id!);

                                                //checkbox on off toggle value
                                                selectedAttributeValue[
                                                    attributesOption.id
                                                        .toString()] = value;
                                              });
                                            } else {
                                              setState(() {
                                                // data[0]
                                                //     .attribute_options!
                                                //     .remove(attributesOption.id);

                                                //This is for getting checked attributes list
                                                checkedAttribute[selectedIndex]
                                                    .attribute_options!
                                                    .remove(
                                                        attributesOption.id!);

                                                //checkbox on off toggle value
                                                selectedAttributeValue[
                                                    attributesOption.id
                                                        .toString()] = value;
                                              });
                                            }
                                          },
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: (IphoneHasNotch.hasNotch) ? 80.0 : 60,
                          width: SizeConfig.screenWidth,
                          padding: (IphoneHasNotch.hasNotch)
                              ? const EdgeInsets.only(
                                  left: 20.0, right: 20, bottom: 20.0)
                              : const EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).shadowColor,
                                  offset: const Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ]),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BlocListener<FilterProductListBloc,
                                      FilterProductListState>(
                                    listener: (context, state) {
                                      if (state is FilterProductListLoaded) {
                                        setState(() {
                                          totalCount = state
                                              .filterProductList.total_count
                                              .toString();
                                        });
                                      }
                                    },
                                    child: BlocBuilder<FilterProductListBloc,
                                        FilterProductListState>(
                                      builder: (context, state) {
                                        if (state is FilterProductListLoaded) {
                                          return Text(
                                            state.filterProductList.total_count
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          );
                                        }
                                        if (state is FilterProductListClear) {
                                          return const Text(
                                            "0",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          );
                                        }
                                        return Text(
                                          totalCount!,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        );
                                      },
                                    ),
                                  ),
                                  const Text(
                                    "Products Found",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                width: getProportionateScreenWidth(120),
                                height: 40.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    data[0].attribute_options =
                                        generateSelectedAttributeId(
                                            selectedAttributeValue);
                                    data[0].attribute_type = "multiselect";
                                    List<Map<String, dynamic>> selectedData =
                                        List<Map<String, dynamic>>.from(
                                            data.map((e) => e.toMap()));
                                    // selectedData.removeWhere((element) =>
                                    //     element["attribute_type"] == null);

                                    if (filterData!.attributes!.length > 1) {
                                      selectedData.removeAt(1);
                                    }
                                    Map<String, dynamic> finalData = {
                                      "limit_per_page": "100",
                                      "order_by": "count",
                                      "skip": "0",
                                      "sort": "0",
                                      "filter_text": "",
                                      "attributes": selectedData
                                    };
                                    filterProductListBloc.add(
                                        LoadFilterProductList(finalData, true,
                                            widget.categorySlug!));
                                  },
                                  // style: ElevatedButton.styleFrom(
                                  //     backgroundColor:
                                  //         kDefaultSecondaryButtonColor),
                                  child: const Text(
                                    "Apply",
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      (isProgress) ? const LoadingIndicatorBar() : Container()
                    ],
                  ),
                );
              }
              if (state is FilterProductAtrributesFailure) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    state.message,
                    textAlign: TextAlign.center,
                  ),
                ));
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
