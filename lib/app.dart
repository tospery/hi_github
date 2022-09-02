import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hi_github/core/constant.dart';
import 'package:hi_github/router/router.dart';

import 'core/function.dart';
import 'generated/l10n.dart';
import 'redux/middleware.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key) {
    HiRouter.shared().configure();
    HiBaseResponse.dataKeys += ['access_token'];
    // HiCache.preInit();
    // var aaa = HiModel();
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final store = Store<HiAPPState>(
    appReducer,
    middleware: middleware,
    initialState: HiAPPState(
      locale: const Locale('zh', 'CH'),
      themeData: getThemeData(HiConstantEx.primarySwatch),
      login: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HiFlutter.initialize(),
      builder: (context, snapshot) {
        return StoreProvider(
          store: store,
          child: StoreBuilder<HiAPPState>(
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
                // onGenerateRoute: (settings) {
                //   log('【主代理】settings = $settings');
                //    var route = HiRouter.shared().generator(settings);
                //    log('【主代理】route = $route');
                //    return route;
                // },
                builder: EasyLoading.init(),
              );
            },
          ),
        );
      },
    );
  }
}
