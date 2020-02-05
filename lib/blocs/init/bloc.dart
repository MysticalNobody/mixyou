import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'index.dart';

class InitBloc extends HydratedBloc<InitEvent, InitState> {
  static final InitBloc _initBlocSingleton = InitBloc._internal();
  factory InitBloc() => _initBlocSingleton;
  InitBloc._internal();

  @override
  InitState get initialState {
    return super.initialState ?? InitState();
  }

  @override
  Stream<InitState> mapEventToState(InitEvent event) async* {
    try {
      yield await event.applyAsync(state: state, bloc: this);
    } catch (_, stackTrace) {
      print(['InitBloc', _, stackTrace]);
      yield state;
    }
  }

  @override
  InitState fromJson(Map<String, dynamic> json) {
    return InitState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(InitState state) {
    return state.toJson();
  }
}
