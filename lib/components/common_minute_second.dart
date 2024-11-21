import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common_text_filed.dart';

// ignore: must_be_immutable
class CommonMinuteSecond extends StatelessWidget {
  TextEditingController minutesController;
  TextEditingController secondsController;
  final Function(String, String) onChanged;
  CommonMinuteSecond(
      {super.key,
      required this.minutesController,
      required this.secondsController,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder:
        (BuildContext context, void Function(void Function()) setState) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            bottmSheetTextFiled(
              "minutes".tr,
              minutesController,
              (value) {
                onChanged(value.toString(), "minutes".tr);
              },
            ),
            const SizedBox(
              width: 20,
            ),
            bottmSheetTextFiled(
              "seconds".tr,
              secondsController,
              (value) {
                onChanged(value.toString(), "seconds".tr);
              },
            ),
          ],
        ),
      );
    });
  }

  Widget bottmSheetTextFiled(
      fieldName, controller, ValueChanged<String>? onChanged) {
    return StatefulBuilder(builder:
        (BuildContext context, void Function(void Function()) setState) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$fieldName",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            CommonTextFiled(
              maxLength: 2,
              horizontal: 10,
              vertical: 15,
              controller: controller,
              keyboardType: TextInputType.number,
              onTap: () {},
              onChanged: onChanged,
            ),
          ],
        ),
      );
    });
  }
}
