// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:unicorn_store/constant/constant.dart';

import '../../size_config.dart';

// ignore: must_be_immutable
class CustomDropDownButton extends StatefulWidget {
  CustomDropDownButton(
      {Key? key,
      this.label,
      this.hintText,
      required this.data,
      required this.callback,
      this.selectedValueOfCountryDropdown})
      : super(key: key);

  final String? label;
  final String? hintText;
  final List<dynamic>? data;
  String? selectedValueOfCountryDropdown;
  final Function callback;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String secondDropvalue = " ";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Text(
              widget.label ?? " ",
              style: TextStyle(fontSize: getProportionateScreenWidth(15.0)),
            ),
            const Positioned(
              right: -7,
              top: -4,
              child: Text("*"),
            ),
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(5.0),
        ),
        Container(
          height: getProportionateScreenHeight(45.0),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(3.0)),
              border: Border.all(width: 1, color: kDefaultBorderColor)),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: const Color(0xFFEEEEEE),
                ),
                child: DropdownButton<String>(
                  value: (secondDropvalue == " ")
                      ? widget.selectedValueOfCountryDropdown
                      : secondDropvalue,
                  isDense: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 0,
                  style: TextStyle(
                      color: const Color(0xFF454545),
                      fontSize: getProportionateScreenWidth(15.0)),
                  onChanged: (String? newValue) {
                    setState(() {
                      widget.callback(newValue);
                      secondDropvalue = newValue!;
                    });
                  },
                  hint: Text(widget.hintText ?? " ",
                      style: TextStyle(
                          color: const Color(0xFF454545),
                          fontSize: getProportionateScreenWidth(15.0))),
                  isExpanded: true,
                  items: widget.data!.map((item) {
                    return DropdownMenuItem(
                      value: item.id.toString(),
                      child: Text(item.name.toString()),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
 
 
 
  }
}
