import 'package:flutter/material.dart';
import 'package:unicorn_store/Data/Models/theme/theme_color.dart';
import 'constant.dart';

class CustomTheme {
  ThemeColor? themeColor;

  ColorScheme lightThemeColorsScheme() {
    return ColorScheme(
      brightness: Brightness.light,
      primary: Color(getColor(themeColor!.primaryColor!)),
      onPrimary: const Color(0xFFFFFFFF),

      // for different card
      primaryContainer: Colors.grey[200],
      onPrimaryContainer: const Color(0xFFFFFFFF),

      secondary: Color(getColor(themeColor!.secondaryColor!)),
      onSecondary: const Color(0xFFFFFFFF),
      secondaryContainer: const Color(0xFFFFFFFF),
      onSecondaryContainer: const Color(0xFF410000),

      //This container color used for success color
      tertiary: const Color(0xFF38A74C),
      onTertiary: const Color(0xFFFFFFFF),

      tertiaryContainer: const Color(0xFFFFDAD6),
      onTertiaryContainer: const Color(0xFF410005),
      error: const Color(0xFFB3261E),
      errorContainer: const Color(0xFFF9DEDC),
      onError: const Color(0xFFFFFFFF),
      onErrorContainer: const Color(0xFF410E0B),
      background: const Color(0xFFF9F9F9),
      onBackground: const Color(0xFF1C1B1F),
      surface: const Color(0xFFFFFBFE),
      onSurface: const Color(0xFF1C1B1F),
      surfaceVariant: const Color(0xFFE7E0EC),
      onSurfaceVariant: const Color(0xFF49454F),
      outline: kDefaultBorderColor,
      onInverseSurface: const Color(0xFFF4EFF4),
      inverseSurface: const Color(0xFF313033),
      inversePrimary: const Color(0xFFFFB3AA),
      shadow: const Color(0xFF000000),
    );
  }

  ThemeData lightTheme(ThemeColor themeColor1) {
    themeColor = themeColor1;
    final ThemeData base = ThemeData.light();
    return base.copyWith(
        primaryColor: lightThemeColorsScheme().primary,
        scaffoldBackgroundColor: lightThemeColorsScheme().background,
        colorScheme: lightThemeColorsScheme(),

        //Color setup
        errorColor: lightThemeColorsScheme().error,

        //App Bar Theme data
        appBarTheme: AppBarTheme(
          backgroundColor: lightThemeColorsScheme().primary,
          foregroundColor: lightThemeColorsScheme().onPrimary,
          shadowColor: lightThemeColorsScheme().shadow,
          titleTextStyle: TextStyle(
              color: lightThemeColorsScheme().onPrimary,
              fontSize: 20.0,
              fontWeight: FontWeight.w600),
          iconTheme: IconThemeData(
            color: lightThemeColorsScheme().onPrimary,
            size: 25,
          ),
        ),

        //Input decoration theme for
        inputDecorationTheme: InputDecorationTheme(
            floatingLabelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? lightThemeColorsScheme().error
                  : lightThemeColorsScheme().onBackground.withOpacity(0.6);
              return TextStyle(
                color: color,
                fontFamily: "Roboto",
              );
            }),
            hintStyle: TextStyle(
              fontFamily: "Roboto",
              color: lightThemeColorsScheme().onBackground.withOpacity(0.6),
              fontSize: 16.0,
            ),
            errorStyle: TextStyle(
              fontFamily: "Roboto",
              color: lightThemeColorsScheme().error,
              fontSize: 14.0,
            ),
            suffixStyle: TextStyle(
                fontFamily: "Roboto",
                color: lightThemeColorsScheme().onBackground.withOpacity(0.6),
                fontSize: 16.0),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
            labelStyle: TextStyle(
              fontFamily: "Roboto",
              fontSize: 16.0,
              color: lightThemeColorsScheme().onBackground.withOpacity(0.6),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: lightThemeColorsScheme().outline),
                borderRadius: const BorderRadius.all(Radius.circular(5.0))),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: lightThemeColorsScheme().secondary),
                borderRadius: const BorderRadius.all(Radius.circular(5.0))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: lightThemeColorsScheme().outline),
                borderRadius: const BorderRadius.all(Radius.circular(5.0))),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: lightThemeColorsScheme().error),
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            )),

        //Elevated button Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: lightThemeColorsScheme().primary,
          foregroundColor: lightThemeColorsScheme().onPrimary,
          textStyle: const TextStyle(
            fontSize: 15.0,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ), // <-- Radius
          ),
        )),

        //Bottom navigation bar theme
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            elevation: 10,
            backgroundColor: lightThemeColorsScheme().onPrimary,
            unselectedItemColor:
                lightThemeColorsScheme().primary.withOpacity(0.4),
            selectedItemColor: lightThemeColorsScheme().primary,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedIconTheme: const IconThemeData(size: 24),
            unselectedIconTheme: const IconThemeData(size: 22),
            selectedLabelStyle: const TextStyle(fontSize: 13),
            unselectedLabelStyle: const TextStyle(fontSize: 12)),

        //CheckBox Theme data
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return lightThemeColorsScheme().secondary;
            }
            return lightThemeColorsScheme().onSurface.withOpacity(0.6);
          }),
          checkColor:
              MaterialStateProperty.all(lightThemeColorsScheme().onSecondary),
        ),

        //card Theme
        cardTheme: const CardTheme(elevation: 2),

        //popup menu button theme
        popupMenuTheme:
            PopupMenuThemeData(color: lightThemeColorsScheme().background));
  }

  int getColor(String color) {
    String a = "0xFF${color.substring(1)}";
    return int.parse(a);
  }

  ColorScheme initialLightThemeColorsScheme() {
    return ColorScheme(
      brightness: Brightness.light,
      primary: const Color(0xFF000000),
      onPrimary: const Color(0xFFFFFFFF),

      // for different card
      primaryContainer: Colors.grey[200],
      onPrimaryContainer: const Color(0xFFFFFFFF),

      secondary: const Color(0xFF0394E8),
      onSecondary: const Color(0xFFFFFFFF),
      secondaryContainer: const Color(0xFFFFFFFF),
      onSecondaryContainer: const Color(0xFF410000),

      //This container color used for success color
      tertiary: const Color(0xFF38A74C),
      onTertiary: const Color(0xFFFFFFFF),

      tertiaryContainer: const Color(0xFFFFDAD6),
      onTertiaryContainer: const Color(0xFF410005),
      error: const Color(0xFFB3261E),
      errorContainer: const Color(0xFFF9DEDC),
      onError: const Color(0xFFFFFFFF),
      onErrorContainer: const Color(0xFF410E0B),
      background: const Color(0xFFF9F9F9),
      onBackground: const Color(0xFF1C1B1F),
      surface: const Color(0xFFFFFBFE),
      onSurface: const Color(0xFF1C1B1F),
      surfaceVariant: const Color(0xFFE7E0EC),
      onSurfaceVariant: const Color(0xFF49454F),
      outline: kDefaultBorderColor,
      onInverseSurface: const Color(0xFFF4EFF4),
      inverseSurface: const Color(0xFF313033),
      inversePrimary: const Color(0xFFFFB3AA),
      shadow: const Color(0xFF000000),
    );
  }

  ThemeData intialLightTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
        primaryColor: initialLightThemeColorsScheme().primary,
        scaffoldBackgroundColor: initialLightThemeColorsScheme().background,
        colorScheme: initialLightThemeColorsScheme(),

        //Color setup
        errorColor: initialLightThemeColorsScheme().error,

        //App Bar Theme data
        appBarTheme: AppBarTheme(
          backgroundColor: initialLightThemeColorsScheme().primary,
          foregroundColor: initialLightThemeColorsScheme().onPrimary,
          shadowColor: initialLightThemeColorsScheme().shadow,
          titleTextStyle: TextStyle(
              color: initialLightThemeColorsScheme().onPrimary,
              fontSize: 20.0,
              fontWeight: FontWeight.w600),
          iconTheme: IconThemeData(
            color: initialLightThemeColorsScheme().onPrimary,
            size: 25,
          ),
        ),

        //Input decoration theme for
        inputDecorationTheme: InputDecorationTheme(
            floatingLabelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? initialLightThemeColorsScheme().error
                  : initialLightThemeColorsScheme()
                      .onBackground
                      .withOpacity(0.6);
              return TextStyle(
                color: color,
                fontFamily: "Roboto",
              );
            }),
            hintStyle: TextStyle(
              fontFamily: "Roboto",
              color:
                  initialLightThemeColorsScheme().onBackground.withOpacity(0.6),
              fontSize: 16.0,
            ),
            errorStyle: TextStyle(
              fontFamily: "Roboto",
              color: initialLightThemeColorsScheme().error,
              fontSize: 14.0,
            ),
            suffixStyle: TextStyle(
                fontFamily: "Roboto",
                color: initialLightThemeColorsScheme()
                    .onBackground
                    .withOpacity(0.6),
                fontSize: 16.0),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
            labelStyle: TextStyle(
              fontFamily: "Roboto",
              fontSize: 16.0,
              color:
                  initialLightThemeColorsScheme().onBackground.withOpacity(0.6),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: initialLightThemeColorsScheme().outline),
                borderRadius: const BorderRadius.all(Radius.circular(5.0))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: initialLightThemeColorsScheme().secondary),
                borderRadius: const BorderRadius.all(Radius.circular(5.0))),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: initialLightThemeColorsScheme().outline),
                borderRadius: const BorderRadius.all(Radius.circular(5.0))),
            errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: initialLightThemeColorsScheme().error),
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            )),

        //Elevated button Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: initialLightThemeColorsScheme().primary,
          foregroundColor: initialLightThemeColorsScheme().onPrimary,
          textStyle: const TextStyle(
            fontSize: 15.0,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ), // <-- Radius
          ),
        )),

        //Bottom navigation bar theme
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            elevation: 10,
            backgroundColor: initialLightThemeColorsScheme().onPrimary,
            unselectedItemColor:
                initialLightThemeColorsScheme().primary.withOpacity(0.4),
            selectedItemColor: initialLightThemeColorsScheme().primary,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedIconTheme: const IconThemeData(size: 24),
            unselectedIconTheme: const IconThemeData(size: 22),
            selectedLabelStyle: const TextStyle(fontSize: 13),
            unselectedLabelStyle: const TextStyle(fontSize: 12)),

        //CheckBox Theme data
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return initialLightThemeColorsScheme().secondary;
            }
            return initialLightThemeColorsScheme().onSurface.withOpacity(0.6);
          }),
          checkColor: MaterialStateProperty.all(
              initialLightThemeColorsScheme().onSecondary),
        ),

        //card Theme
        cardTheme: const CardTheme(elevation: 2),

        //popup menu button theme
        popupMenuTheme: PopupMenuThemeData(
            color: initialLightThemeColorsScheme().background));
  }
}
