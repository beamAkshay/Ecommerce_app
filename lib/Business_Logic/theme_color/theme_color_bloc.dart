import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Repositories/theme/theme_color_repository.dart';

import '../../Data/Models/theme/theme_color.dart';

part 'theme_color_event.dart';
part 'theme_color_state.dart';

class ThemeColorBloc extends Bloc<ThemeColorEvent, ThemeColorState> {
  final themeColorRepository = ThemeColorRepository();
  ThemeColorBloc() : super(ThemeColorInitial()) {
    on<LoadThemeColor>((event, emit) async {
      try {
        emit(ThemeColorLoading());
        final themeColor = await themeColorRepository.getThemeColor();
        emit(ThemeColorLoaded(themeColor));
      } catch (e) {
        emit(ThemeColorError(e.toString()));
      }
    });
  }
}
