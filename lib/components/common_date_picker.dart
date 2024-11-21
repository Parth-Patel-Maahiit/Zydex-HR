import 'package:flutter/material.dart';
import 'package:scroll_wheel_date_picker/scroll_wheel_date_picker.dart';

import '../util/app_color_constants.dart';

class CommonDatePicker extends StatelessWidget {
  final Function(DateTime value)? onSelectedItemChanged;
  const CommonDatePicker({super.key, this.onSelectedItemChanged});

  @override
  Widget build(BuildContext context) {
    return ScrollWheelDatePicker(
      theme: CurveDatePickerTheme(
        itemExtent: 50,
        wheelPickerHeight: 250.0,
        diameterRatio: 1.3,
        overlay: ScrollWheelDatePickerOverlay.highlight,
        itemTextStyle: defaultItemTextStyle.copyWith(
          color: AppColorConstants.black,
        ),
        overlayColor: AppColorConstants.bggrey,
        monthFormat: MonthFormat.threeLetters,
        overAndUnderCenterOpacity: 0.2,
      ),
      onSelectedItemChanged: onSelectedItemChanged,
    );
  }
}
