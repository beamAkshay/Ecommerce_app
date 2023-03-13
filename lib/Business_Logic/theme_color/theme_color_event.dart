part of 'theme_color_bloc.dart';

abstract class ThemeColorEvent extends Equatable {
  const ThemeColorEvent();

  @override
  List<Object> get props => [];
}

class LoadThemeColor extends ThemeColorEvent {
  const LoadThemeColor();
}
