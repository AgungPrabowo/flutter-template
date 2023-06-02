part of 'main_bloc.dart';

class MainState {
  final bool isDarkMode;
  final String language;
  final bool isLoading;

  const MainState({
    required this.isDarkMode,
    required this.language,
    required this.isLoading,
  });

  MainState copyWith({
    bool? isDarkMode,
    String? language,
    bool? isLoading,
  }) =>
      MainState(
        isDarkMode: isDarkMode ?? this.isDarkMode,
        language: language ?? this.language,
        isLoading: isLoading ?? this.isLoading,
      );
}

class MainInitial extends MainState {
  MainInitial()
      : super(
          isDarkMode: false,
          isLoading: true,
          language: "id",
        );
}
