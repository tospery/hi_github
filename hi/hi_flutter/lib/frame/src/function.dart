import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/hi_core.dart';

Widget hiImage(String url, {double? width, double? height}) {
  return CachedNetworkImage(
    width: width,
    height: height,
    fit: BoxFit.cover,
    placeholder: (BuildContext context, String url) =>
        Container(color: Colors.grey[200]),
    errorWidget: (BuildContext context, String url, dynamic error) =>
        const Icon(Icons.error),
    imageUrl: url,
  );
}

BoxBorder hiBorder({
  BuildContext? context,
  Color? color,
  double? width,
  bool top = false,
  bool right = false,
  bool bottom = false,
  bool left = false,
}) {
  var borderSide = Divider.createBorderSide(
    context,
    width: width,
    color: color,
  );
  return Border(
    top: top ? borderSide : BorderSide.none,
    right: right ? borderSide : BorderSide.none,
    bottom: bottom ? borderSide : BorderSide.none,
    left: left ? borderSide : BorderSide.none,
  );
}

Icon hiIndicator({
  BuildContext? context,
  IconData? icon,
  Color? color,
  double? size,
}) {
  return Icon(
    icon,
    color: color ?? context?.themeData.indicatorColor,
    size: size ?? 24,
  );
}
