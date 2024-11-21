import 'package:flutter/material.dart';

import '../util/app_color_constants.dart';

void openNonScrollBottmSheet(
    {required BuildContext context,
    required Widget data,
    required double initial}) {
  showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(45))),
      isScrollControlled: true,
      barrierColor: const Color.fromARGB(61, 0, 0, 0),
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                transform: Matrix4.translationValues(0.0, -70, 0.0),
                child: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    shape: const CircleBorder(),
                    backgroundColor: Colors.black,
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
              ),
            ),
            Expanded(
              child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(35.0)),
                  child: data),
            ),
          ],
        );
      },
      context: context);
}

void openCustomSizeBottomSheet({
  required BuildContext context,
  required Widget data,
  bool? isScrollControlled,
}) {
  showModalBottomSheet<void>(
    isScrollControlled: isScrollControlled ?? true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(45))),
    builder: (BuildContext context) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height *
              0.9, // Default to 80% of screen height
        ),
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    transform: Matrix4.translationValues(0.0, -70, 0.0),
                    child: FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        shape: const CircleBorder(),
                        backgroundColor: Colors.black,
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        )),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height *
                        0.9, // Default to 80% of screen height
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(45.0),
                              topRight: Radius.circular(45.0)),
                          child: data),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
    context: context,
  );
}

void openScrollBottmSheet(
    {required BuildContext context,
    required Widget data,
    Widget? titleWidget,
    bool isDraggable = true,
    double maxChildSize = 0.9,
    required double initial}) {
  showModalBottomSheet<void>(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(45))),
    isScrollControlled: true,
    barrierColor: const Color.fromARGB(61, 0, 0, 0),
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
          initialChildSize: initial,
          maxChildSize: maxChildSize,
          minChildSize: 0.2,
          snap: false,
          expand: false,
          builder: (
            BuildContext context,
            ScrollController scrollController,
          ) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    transform: Matrix4.translationValues(0.0, -70, 0.0),
                    child: FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        shape: const CircleBorder(),
                        backgroundColor: Colors.black,
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        )),
                  ),
                ),
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(35.0)),
                  child: Container(
                    color: AppColorConstants.white,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        if (isDraggable)
                          SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColorConstants.outline,
                                        borderRadius: BorderRadius.circular(5)),
                                    height: 4,
                                    width: 70,
                                  ),
                                ),
                                if (titleWidget != null) titleWidget,
                              ],
                            ),
                          ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: data,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          });
    },
    context: context,
  );
}
