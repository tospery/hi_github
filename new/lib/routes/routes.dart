import 'package:hi_get/hi_get.dart';
import '../module/home/home_binding.dart';
import '../module/home/home_view.dart';
import '../module/personal/personal_binding.dart';
import '../module/personal/personal_view.dart';
import '../module/root/root_binding.dart';
import '../module/root/root_view.dart';
import '../module/star/star_binding.dart';
import '../module/star/star_view.dart';
import '../module/trending/trending_binding.dart';
import '../module/trending/trending_view.dart';

class Routes {
  // root
  static const root = '/';
  // home
  static const home = '/home';
  static const trending = '$home/trending';
  static const star = '$home/star';
  static const personal = '$home/personal';

  static final getPages = [
    GetPage(
      name: root,
      page: () => const RootView(),
      binding: RootBinding(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
    ),
    GetPage(
      name: home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: trending,
      page: () => const TrendingView(),
      binding: TrendingBinding(),
    ),
    GetPage(
      name: star,
      page: () => const StarView(),
      binding: StarBinding(),
    ),
    GetPage(
      name: personal,
      page: () => const PersonalView(),
      binding: PersonalBinding(),
    ),
  ];
}
