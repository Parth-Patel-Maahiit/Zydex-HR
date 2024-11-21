import 'package:flutter/material.dart';
import 'package:scroll_time_picker/scroll_time_picker.dart';

class CommonTimePicker extends StatelessWidget {
  final DateTime selectedTime;
  final ValueChanged<DateTime> onDateTimeChanged;
  const CommonTimePicker(
      {super.key, required this.selectedTime, required this.onDateTimeChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
        child: ScrollTimePicker(
          selectedTime: selectedTime,
          is12hFormat: true,
          options: const TimePickerOptions(diameterRatio: 4, itemExtent: 40),
          scrollViewOptions: const TimePickerScrollViewOptions(
            hour: ScrollViewDetailOptions(
                margin: EdgeInsets.all(10),
                selectedTextStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            minute: ScrollViewDetailOptions(
                margin: EdgeInsets.all(10),
                selectedTextStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            f12h: ScrollViewDetailOptions(
                margin: EdgeInsets.all(10),
                selectedTextStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          onDateTimeChanged: onDateTimeChanged,
        ));
  }
}
