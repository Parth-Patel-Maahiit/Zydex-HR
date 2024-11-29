import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CommonImagePicture extends StatelessWidget {
  const CommonImagePicture(
    this.name, {
    super.key,
    this.semanticsLabel,
    this.size,
    this.isString = false,
    this.isurl = false,
    this.type,
    this.color,
    this.fit,
  });
  final dynamic name;
  final String? semanticsLabel;
  final double? size;
  final bool isString;
  final bool isurl;
  final String? type;
  final Color? color;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Skeleton.replace(
      replace: true,
      replacement: Icon(
        Icons.abc_rounded,
        size: size,
        color: color,
      ),
      child: name is IconData
          ? Icon(
              name,
              size: size,
              color: color,
              semanticLabel: '$semanticsLabel',
            )
          : name is String
              ? type == "SVG"
                  ? isString
                      ? SvgPicture.string(
                          name!,
                          height: size,
                          width: size,
                          colorFilter: color != null
                              ? ColorFilter.mode(color!, BlendMode.srcIn)
                              : null,
                          fit: fit ?? BoxFit.scaleDown,
                          semanticsLabel: '$semanticsLabel',
                        )
                      : SvgPicture.asset(
                          name!,
                          height: size,
                          width: size,
                          colorFilter: color != null
                              ? ColorFilter.mode(color!, BlendMode.srcIn)
                              : null,
                          fit: fit ?? BoxFit.scaleDown,
                          semanticsLabel: '$semanticsLabel',
                        )
                  : isurl
                      ? Image.network(
                          name!,
                          height: size,
                          width: size,
                          color: color,
                          fit: fit ?? BoxFit.scaleDown,
                        )
                      : isString
                          ? Image.file(
                              File(name!),
                              height: size,
                              width: size,
                              color: color,
                              fit: fit ?? BoxFit.scaleDown,
                            )
                          : Image.asset(
                              name!,
                              height: size,
                              width: size,
                              color: color,
                              fit: fit ?? BoxFit.scaleDown,
                            )
              : const SizedBox(
                  height: 0,
                  width: 0,
                ),
    );
  }
}
