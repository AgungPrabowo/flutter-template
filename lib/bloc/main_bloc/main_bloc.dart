import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/shared/shared.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial());

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    if (event is InitMainEvent) {
      yield MainLoading();
      try {
        final language = await Cache.getCache(Keys.LANGUAGE);
        final isDarkMode = await Cache.getCacheBool(Keys.DARK_MODE);
        await Future.delayed(Duration(seconds: 3));
        yield MainLoaded(
          language: language.isEmpty ? "en" : language,
          isDarkMode: isDarkMode,
        );
      } catch (e) {
        yield MainError(Keys.MSG_ERROR);
      }
    }
  }
}
