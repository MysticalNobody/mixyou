import 'dart:async';

import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mexyou/blocs/init/index.dart';
import 'package:mexyou/database/database.dart';
import 'package:mexyou/database/hydratedStorage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bloc/bloc.dart';
import 'package:mexyou/generated/i18n.dart';
import 'package:mexyou/res/res.dart';
import 'package:mexyou/screens/auth/index.dart';

final isDebugMode = true;
final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (isDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  runZoned<Future<void>>(() async {
    startHome();
  }, onError: (error, stackTrace) async {
    if (isDebugMode) {
      print('Caught error: $error');
      print(stackTrace);
    }
  });
}

void startHome() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBase().open();
  var sembastHydratedStorage = await MYHydratedStorage.getInstance();
  BlocSupervisor.delegate = HydratedBlocDelegate(sembastHydratedStorage);
  InitBloc().add(InitInitEvent());

  final i18n = I18n.delegate;

  runApp(
    BlocBuilder(
      bloc: InitBloc(),
      builder: (context, InitState state) {
        return BackGestureWidthTheme(
          backGestureWidth: BackGestureWidth.fraction(.5),
          child: MaterialApp(
            navigatorKey: navigatorKey,
            title: 'MEXYOU',
            showSemanticsDebugger: false,
            debugShowCheckedModeBanner: false,
            theme: mainTheme,
            localizationsDelegates: [i18n, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate],
            supportedLocales: i18n.supportedLocales,
            localeResolutionCallback: i18n.resolution(fallback: new Locale("en", "EN")),
            builder: (context, child) {
              ErrorWidget.builder = (FlutterErrorDetails err) {
                return Container(
                  color: Colors.black,
                  child: Text(
                    err.stack.toString(),
                    style: simpleWhiteTextStyle,
                  ),
                );
              };
              return AuthScreen();
            },
          ),
        );
      },
    ),
  );
}
