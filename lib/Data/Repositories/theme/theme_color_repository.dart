import '../../Data_Providers/theme/theme_color_api.dart';
import '../../Models/theme/theme_color.dart';

class ThemeColorRepository {
  final _themeColorApi = ThemeColorApi();

  Future<ThemeColor> getThemeColor() {
    return _themeColorApi.getThemeColor();
  }
}
