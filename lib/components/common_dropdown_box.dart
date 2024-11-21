import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../util/app_color_constants.dart';

class CommonDropDownBox extends StatelessWidget {
  final DropdownButtonBuilder? selectedItemBuilder;
  final List<DropdownMenuItem<String>>? items;
  final ValueChanged<dynamic>? onChanged;
  final String? value;
  final String hint;
  final double? height;
  final Color hintColor;

  const CommonDropDownBox({
    super.key,
    this.selectedItemBuilder,
    this.items,
    this.value,
    this.onChanged,
    required this.hint,
    this.height,
    this.hintColor = AppColorConstants.black,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        selectedItemBuilder: selectedItemBuilder,
        isExpanded: true,
        hint: Text(
          hint,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: hintColor,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        items: items,
        value: value,
        onChanged: (value) {
          if (onChanged != null) {
            onChanged!(value);
          }
        },
        buttonStyleData: ButtonStyleData(
          height: 55,
          padding: const EdgeInsets.fromLTRB(0, 6, 14, 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColorConstants.border,
            ),
            color: AppColorConstants.white,
          ),
          elevation: 0,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
          ),
          iconSize: 25,
          iconEnabledColor: AppColorConstants.icons,
          iconDisabledColor: AppColorConstants.icons,
        ),
        dropdownStyleData: DropdownStyleData(
          elevation: 0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColorConstants.border),
            color: AppColorConstants.white,
          ),
          offset: const Offset(0, -5),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: WidgetStateProperty.all<double>(6),
            thumbVisibility: WidgetStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 66,
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        ),
      ),
    );
  }
}
