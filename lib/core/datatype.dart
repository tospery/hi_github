// enum Vehicle implements Comparable<Vehicle> {
//   car(tires: 4, passengers: 5, carbonPerKilometer: 400),
//   bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
//   bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0);

//   const Vehicle({
//     required this.tires,
//     required this.passengers,
//     required this.carbonPerKilometer,
//   });

//   final int tires;
//   final int passengers;
//   final int carbonPerKilometer;

//   int get carbonFootprint => (carbonPerKilometer / passengers).round();

//   @override
//   int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;
// }

import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_flutter/routerx/path.dart';

enum PersonalPortalType {
  setting,
  about,
  feedback;

  String get path => {
        setting: HiRouterPath.about,
        about: HiRouterPath.about,
        feedback: HiRouterPath.about,
      }[this]!;

  factory PersonalPortalType.fromValue(int value) =>
      {
        1: PersonalPortalType.setting,
        2: PersonalPortalType.about,
        3: PersonalPortalType.feedback,
      }[value] ??
      PersonalPortalType.setting;
}
