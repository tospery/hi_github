import 'package:flutter/material.dart';
import 'package:hi_get/hi_get.dart';
import 'star_controller.dart';

class StarView extends GetView<StarController> {
  const StarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: ColorsHiCoreEx.randomColor,
        ),
      ),
    );
  }
}
