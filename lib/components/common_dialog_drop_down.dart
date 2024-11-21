import 'package:flutter/material.dart';

import '../components/common_title_text.dart';
import '../util/app_color_constants.dart';
import '../util/dimensions.dart';
import '../components/common.dart';

class CommonDialogDropDown {
  static Future<void> showDropdownDialog<T>({
    required BuildContext context,
    required String title,
    required List<T> items,
    required void Function(T selectedItem) onTap,
    String Function(T)? itemLabelBuilder,
    T? selectedItem,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          surfaceTintColor: AppColorConstants.baseBG,
          backgroundColor: AppColorConstants.baseBG,
          contentPadding: const EdgeInsets.all(3),
          title: CommonTitleText(title: title),
          titlePadding: const EdgeInsets.all(10.0),
          content: SizedBox(
            width: Dimensions.screenwidth * 0.8,
            child: ListView.separated(
              shrinkWrap: true,
              primary: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return InkWell(
                  onTap: () {
                    onTap(item);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          itemLabelBuilder != null
                              ? itemLabelBuilder(item)
                              : item.toString(),
                          style: TextStyle(
                              fontSize: 18, color: AppColorConstants.textColor),
                        ),
                        if (selectedItem != null && item == selectedItem) ...[
                          const Icon(
                            Icons.radio_button_checked,
                            color: AppColorConstants.blue100,
                          ),
                        ] else ...[
                          Icon(
                            Icons.circle_outlined,
                            color: AppColorConstants.iconColor,
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return divider();
              },
            ),
          ),
        );
      },
    );
  }
}
