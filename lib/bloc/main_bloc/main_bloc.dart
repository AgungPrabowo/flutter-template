import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_template/shared/shared.dart';

part 'main_state.dart';

class MainBloc extends Cubit<MainState> {
  MainBloc() : super(MainInitial()) {
    initialData();
  }

  Future<void> initialData() async {
    emit(state.copyWith(isLoading: true));
    final language = await Cache.getCache(Keys.language);
    final isDarkMode = await Cache.getCacheBool(Keys.darkMode);
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(
      isLoading: false,
      language: language.isEmpty ? "en" : language,
      isDarkMode: isDarkMode,
    ));
  }
}
