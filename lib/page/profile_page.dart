// import 'package:flutter/material.dart';
// import 'package:hi_flutter/hi_flutter.dart';
// import '../extension/build_context.dart';

// import '../model/user.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   // User? user;
//   List<HiNormalPortal> portals = [];

//   @override
//   void initState() {
//     super.initState();
//     // user = context.store.state.user;
//     // log('user = $user');
//   }

//   @override
//   Widget build(BuildContext context) {
//     // var settings = context.settings;
//     // var name = settings?.name;
//     // var arguments = settings?.arguments;
//     // log('settings = $settings, name = $name, arguments = $arguments');
//     log('build');
//     return StoreBuilder<HiAPPState>(
//       builder: (context, store) {
//         _initData(store.state.user as User?);
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(store.state.user?.username ?? ''),
//           ),
//           body: Container(
//             margin: const EdgeInsets.only(top: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 HiPortalListView(
//                   portals: portals,
//                 ),
//                 _buildLogoutItem(),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _initData(User? user) {
//     if (portals.isNotEmpty) {
//       return;
//     }
//     portals.addAll([
//       HiNormalPortal(
//         title: context.string.nickname,
//         detail: user?.username,
//       ),
//       HiNormalPortal(
//         title: context.string.bio,
//         detail: user?.bio,
//         separated: false,
//         spacer: 15,
//       ),
//       HiNormalPortal(
//         title: context.string.team,
//         detail: user?.company,
//       ),
//       HiNormalPortal(
//         title: context.string.city,
//         detail: user?.location,
//       ),
//       HiNormalPortal(
//         title: context.string.blog,
//         separated: false,
//         detail: user?.blog,
//       ),
//     ]);
//   }

//   Widget _buildLogoutItem() {
//     return Container(
//       height: 50,
//       color: Colors.white,
//       child: Center(
//         child: InkWell(
//           onTap: _doLogout,
//           child: Text(
//             context.string.exitLogin,
//             style: const TextStyle(
//               fontSize: 17,
//               color: Colors.red,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _doLogout() async {
//     final result = await hiAlert(
//       context: context,
//       title: context.string.exitLogin,
//       message: context.string.alertLogoutMessage,
//       ok: context.string.ok,
//       cancel: context.string.cancel,
//     );
//     log('result = $result');
//   }
// }
