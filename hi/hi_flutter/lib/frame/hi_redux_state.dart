// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:hi_flutter/core/logger.dart';
// import 'ex/build_context.dart';
// import '../core/user.dart';
// import '../core/context.dart';
// import 'hi_base_state.dart';
// import 'redux/app_state.dart';

// abstract class HiReduxState<T extends StatefulWidget> extends HiBaseState<T> {
//   HiUser? get user => context.store.state.user;

//   @override
//   Widget build(BuildContext context) {
//     var arguments = context.modalRouteSettingsArguments;
//     log('arguments = $arguments');
//     return StoreBuilder<HiAPPState>(
//       builder: (context, store) {
//         return Scaffold(
//           appBar: buildAppBar(),
//           body: buildBodyView(),
//         );
//       },
//     );
//   }

//   PreferredSizeWidget? buildAppBar() {
//     return AppBar(
//       title: const Text('abcd1234'),
//     );
//   }

//   Widget buildBodyView();
// }
