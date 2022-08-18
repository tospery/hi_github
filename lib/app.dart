import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hi_github/router/router.dart';

import 'core/function.dart';
import 'generated/l10n.dart';
import 'redux/app_state.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key) {
    HiRouter.shared().configure();
    HiBaseResponse.dataKeys += ['access_token'];
    // HiCache.preInit();
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final store = Store<APPState>(
    appReducer,
    middleware: middleware,
    initialState: APPState(
      locale: const Locale('zh', 'CH'),
      themeData: getThemeData(Colors.blue),
      login: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HiCache.preInit(),
      builder: (context, snapshot) {
        return StoreProvider(
          store: store,
          child: StoreBuilder<APPState>(
            builder: (context, store) {
              return MaterialApp(
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                localeListResolutionCallback: (locales, supported) {
                  for (var loc in locales ?? []) {
                    for (var spt in supported) {
                      if (spt.languageCode == loc.languageCode) return spt;
                    }
                  }
                  return const Locale('zh', 'CN');
                },
                locale: store.state.locale,
                theme: store.state.themeData,
                onGenerateRoute: HiRouter.shared().generator,
                builder: EasyLoading.init(),
              );
            },
          ),
        );
      },
    );
  }
}
