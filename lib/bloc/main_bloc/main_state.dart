part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {}

class MainLoading extends MainState {}

class MainError extends MainState {
  final String error;

  MainError(this.error);
}

class MainLoaded extends MainState {
  final bool isDarkMode;
  final String language;

  MainLoaded({
    required this.isDarkMode,
    required this.language,
  });

  MainLoaded copyWith({
    bool? isDarkMode,
    String? language,
  }) =>
      MainLoaded(
        isDarkMode: isDarkMode ?? this.isDarkMode,
        language: language ?? this.language,
      );

  @override
  List<Object> get props => [isDarkMode, language];
}
