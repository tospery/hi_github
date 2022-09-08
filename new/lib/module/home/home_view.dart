import 'package:flutter/material.dart';
import 'package:hi_get/hi_get.dart';
import '../../routes/routes.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(builder: (context, delegate, current) {
      final location = current?.location;
      log('home location: $location');
      var currentIndex = 0;
      if (location?.startsWith(Routes.star) ?? false) {
        currentIndex = 1;
      } else if (location?.startsWith(Routes.personal) ?? false) {
        currentIndex = 2;
      }
      return Scaffold(
        body: GetRouterOutlet(
          initialRoute: Routes.trending,
          key: Get.nestedKey(Routes.home),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            switch (value) {
              case 0:
                delegate.toNamed(Routes.home);
                break;
              case 1:
                delegate.toNamed(Routes.star);
                break;
              case 2:
                delegate.toNamed(Routes.personal);
                break;
              default:
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'trending',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded),
              label: 'star',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded),
              label: 'personal',
            ),
          ],
        ),
      );
    });
  }
}
