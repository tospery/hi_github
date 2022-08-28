import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'hi_base_state.dart';

abstract class HiReduxState<T extends StatefulWidget> extends HiBaseState<T> {
  HiUser? get user => context.store.state.user;

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<HiAPPState>(
      builder: (context, store) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('abcd1234'),
          ),
          body: buildBodyView(),
        );
      },
    );
  }

  Widget buildBodyView();
}
