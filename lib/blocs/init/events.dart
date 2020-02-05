import 'dart:async';
import 'dart:io' as io;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'index.dart';

@immutable
abstract class InitEvent {
  Future<InitState> applyAsync({InitState state, InitBloc bloc});
}

class InitInitEvent extends InitEvent {
  @override
  Future<InitState> applyAsync({InitState state, InitBloc bloc}) async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    if (io.Platform.isAndroid)
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
    else
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

    return InitState()
      ..inited = true;
  }
}
