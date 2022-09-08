import 'package:flutter/material.dart';
import 'package:hi_get/hi_get.dart';
import '../../routes/routes.dart';
import 'root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(builder: (context, delegate, current) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('HiGithub'),
          centerTitle: true,
        ),
        body: GetRouterOutlet(initialRoute: Routes.home),
      );
    });
  }
}
