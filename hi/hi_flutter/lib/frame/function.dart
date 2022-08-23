import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
  bool top = false,
  bool right = false,
  bool bottom = false,
  bool left = false,
}) {
  BorderSide borderSide = BorderSide(width: 0.5, color: Colors.grey[200]!);
  return Border(
    top: top ? borderSide : BorderSide.none,
    right: right ? borderSide : BorderSide.none,
    bottom: bottom ? borderSide : BorderSide.none,
    left: left ? borderSide : BorderSide.none,
  );
}
