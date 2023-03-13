part of 'theme_color_bloc.dart';

abstract class ThemeColorState extends Equatable {
  const ThemeColorState();

  @override
  List<Object> get props => [];
}

class ThemeColorInitial extends ThemeColorState {}

class ThemeColorLoading extends ThemeColorState {}

class ThemeColorLoaded extends ThemeColorState {
  final ThemeColor themeColor;

  const ThemeColorLoaded(this.themeColor);
}

class ThemeColorError extends ThemeColorState {
  final String? message;
  const ThemeColorError(this.message);
}
