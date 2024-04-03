import 'package:doti_starter/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:doti_starter/src/core/constants/index.dart';
import 'package:doti_starter/src/core/generated/colors.gen.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

/// Class that contains all the different styles of an app
class Style {
  /// Custom page transitions
  static const _pageTransitionsTheme = PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );

  // static TextStyle get elevatedButtonTextStyleDark {
  //   return const TextStyle(
  //     fontSize: 14,
  //     color: Colors.black,
  //   );
  // }

  // static ElevatedButtonThemeData get _customElevatedButtonTheme {
  //   return ElevatedButtonThemeData(
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: const Color(0xFF57FFAD),
  //       //onPrimary: Colors.green,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(16.0),
  //       ),
  //       textStyle: elevatedButtonTextStyleDark,
  //       shadowColor: Colors.transparent,
  //       elevation: 0,
  //     ),
  //   );
  // }

  // static OutlinedButtonThemeData get _customOutlinedButtonTheme {
  //   return OutlinedButtonThemeData(
  //     style: OutlinedButton.styleFrom(
  //       side: const BorderSide(
  //         color: Colors.transparent,
  //       ),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(16.0),
  //       ),
  //       elevation: 0,
  //       textStyle: const TextStyle(fontSize: 16),
  //     ),
  //   );
  // }

  // static TextButtonThemeData get _customTextButtonTheme {
  //   return TextButtonThemeData(
  //     style: TextButton.styleFrom(
  //       textStyle: const TextStyle(
  //         fontWeight: FontWeight.w400,
  //         fontSize: 13.0,
  //         decoration: TextDecoration.underline,
  //       ),
  //     ),
  //   );
  // }

  // static InputDecorationTheme get _inputDecorationTheme {
  //   return InputDecorationTheme(
  //     prefixIconColor: const Color(0xff999999),
  //     suffixIconColor: const Color(0xff00a468),
  //     fillColor: const Color(0xffF8F8F8),
  //     filled: true,
  //     isDense: true,
  //     contentPadding: const EdgeInsets.all(16),
  //     hoverColor: Colors.blue.shade100,
  //     enabledBorder: const OutlineInputBorder(
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(16),
  //       ),
  //       borderSide: BorderSide(
  //         width: 0,
  //         style: BorderStyle.none,
  //         color: Colors.transparent,
  //       ),
  //     ),
  //     focusedBorder: const OutlineInputBorder(
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(16),
  //       ),
  //       borderSide: BorderSide(
  //         width: 0,
  //         style: BorderStyle.none,
  //         color: Colors.transparent,
  //       ),
  //     ),
  //     hintStyle: TextStyle(
  //       fontFamily: GoogleFonts.roboto().fontFamily,
  //       fontWeight: FontWeight.w300,
  //       fontSize: 14.0,
  //       color: const Color(0xff999999),
  //     ),
  //   );
  // }

  /// Light style
  static ThemeData get light {
    final base = ThemeData.light();

    final textTheme = _buildTextTheme(base);
    return base.copyWith(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      colorScheme: const ColorScheme.light().copyWith(
        primary: ColorName.primary,
        secondary: ColorName.secondary,
        // onSecondary: Colors.white,
        onError: ColorName.error,
        background: ColorName.backgroundlight,
        brightness: Brightness.light,
        error: ColorName.error,
      ),
      primaryColor: ColorName.primary,
      scaffoldBackgroundColor: ColorName.backgroundlight,
      dividerColor: ColorName.learninactivecard,
      pageTransitionsTheme: _pageTransitionsTheme,
      textTheme: GoogleFonts.robotoTextTheme(textTheme),
      popupMenuTheme: _buildPopupMenuThemeData(),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorName.navigationlight,
        selectedItemColor: ColorName.primary,
        unselectedItemColor: ColorName.navtextlightinactive,
        // unselectedItemColor: ColorName.navtextlightinactive,

        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }

  /// Dark style
  static ThemeData get dark {
    final base = ThemeData.dark();
    final textTheme = _buildTextTheme(base);

    return base.copyWith(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: ColorName.primary,
        secondary: ColorName.secondary,
        onError: ColorName.error,
        error: ColorName.error,
        background: ColorName.backgrounddark,
        brightness: Brightness.dark,
      ),
      primaryColor: ColorName.primary,
      canvasColor: ColorName.backgrounddark,
      scaffoldBackgroundColor: ColorName.backgrounddark,
      cardColor: ColorName.backgrounddark,
      dividerColor: ColorName.backgroundlight,
      dialogBackgroundColor: ColorName.backgrounddark,
      pageTransitionsTheme: _pageTransitionsTheme,
      textTheme: GoogleFonts.robotoTextTheme(textTheme),
      popupMenuTheme: _buildPopupMenuThemeData(),
    );
  }

  static PopupMenuThemeData _buildPopupMenuThemeData() {
    return PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RadiusSize.popupMenuBorderRadius),
      ),
    );
  }

  static TextTheme _buildTextTheme(ThemeData base) {
    final textTheme = base.textTheme;

    return textTheme.copyWith(
      displayLarge: textTheme.displayLarge?.merge(
        TextStyles.header,
      ),
      displaySmall: textTheme.displaySmall?.merge(
        TextStyles.miniHeader,
      ),
      headlineMedium: textTheme.headlineMedium?.merge(
        TextStyles.medium,
      ),
      headlineSmall: textTheme.headlineSmall?.merge(
        TextStyles.xmedium,
      ),
      titleLarge: textTheme.titleLarge?.merge(
        TextStyles.small,
      ),
      titleMedium: textTheme.titleMedium?.merge(
        TextStyles.xSmall,
      ),
    );
  }
}


















// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// final lightTheme = _getTheme();

// const _primary = Colors.indigo;
// const _secondary = Colors.amber;

// const _background = Color(0xFFF5F5F5);
// const _lightest = Colors.white;
// const _darkest = Colors.black;
// const _darker = Colors.black87;
// const _divider = Colors.grey;
// const _disabled = Colors.grey;

// const _red = Colors.red;

// final _lightColorScheme = ColorScheme(
//   brightness: Brightness.light,
//   // Primary
//   primary: _primary,
//   onPrimary: _lightest,
//   primaryContainer: _primary.withOpacity(0.2),
//   onPrimaryContainer: _lightest,
//   // Secondary
//   secondary: _secondary,
//   onSecondary: _darkest,
//   secondaryContainer: _secondary.withOpacity(0.2),
//   onSecondaryContainer: _darkest,
//   // Error
//   error: _red,
//   onError: _lightest,
//   // Background
//   background: _background,
//   onBackground: _darkest,
//   // Surface
//   surface: _lightest,
//   onSurface: _darkest,
//   // Outline
//   outline: _divider,
// );

// ThemeData _getTheme() {
//   final colorScheme = _lightColorScheme;
//   final textTheme = _getTextTheme(colorScheme);
//   final primaryTextTheme = textTheme.apply(
//     displayColor: colorScheme.onPrimary,
//     bodyColor: colorScheme.onPrimary,
//   );

//   final buttonShape = RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(16),
//   );
//   const buttonPadding = EdgeInsets.symmetric(
//     horizontal: 24,
//     vertical: 12,
//   );
//   final buttonTextStyle = textTheme.titleMedium;

//   return ThemeData(
//     useMaterial3: true,
//     brightness: Brightness.light,
//     colorScheme: colorScheme,
//     textTheme: textTheme,
//     primaryTextTheme: primaryTextTheme,
//     scaffoldBackgroundColor: colorScheme.background,
//     disabledColor: _disabled,
//     dividerTheme: const DividerThemeData(
//       color: _divider,
//       space: 1,
//       thickness: 1,
//     ),
//     chipTheme: ChipThemeData(
//       labelStyle: textTheme.labelSmall,
//       side: const BorderSide(
//         width: 0,
//       ),
//     ),
//     cardTheme: const CardTheme(
//       clipBehavior: Clip.antiAlias,
//       elevation: 0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(6)),
//         side: BorderSide(
//           width: 1,
//           color: _divider,
//         ),
//       ),
//       color: _background,
//       surfaceTintColor: Colors.transparent,
//       margin: EdgeInsets.zero,
//     ),
//     popupMenuTheme: PopupMenuThemeData(
//       color: _background,
//       surfaceTintColor: colorScheme.background,
//     ),
//     bottomSheetTheme: const BottomSheetThemeData(
//       showDragHandle: false,
//       backgroundColor: _background,
//       surfaceTintColor: Colors.transparent,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(20),
//         ),
//       ),
//     ),
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       type: BottomNavigationBarType.fixed,
//       showSelectedLabels: true,
//       showUnselectedLabels: true,
//     ),
//     navigationRailTheme: const NavigationRailThemeData(
//       labelType: NavigationRailLabelType.all,
//       groupAlignment: 0,
//     ),
//     appBarTheme: AppBarTheme(
//       titleTextStyle: textTheme.titleLarge,
//       backgroundColor: _background,
//     ),
//     dialogTheme: DialogTheme(
//       backgroundColor: colorScheme.background,
//       surfaceTintColor: colorScheme.background,
//       titleTextStyle: textTheme.titleLarge,
//     ),
//     snackBarTheme: SnackBarThemeData(
//       behavior: SnackBarBehavior.floating,
//       backgroundColor: _darkest,
//       contentTextStyle: primaryTextTheme.bodyLarge,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(8)),
//       ),
//     ),
//     listTileTheme: ListTileThemeData(
//       iconColor: colorScheme.primary,
//     ),
//     inputDecorationTheme: InputDecorationTheme(
//       filled: true,
//       floatingLabelBehavior: FloatingLabelBehavior.auto,
//       contentPadding: const EdgeInsets.symmetric(
//         horizontal: 24,
//         vertical: 16,
//       ),
//       border: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(8)),
//         borderSide: BorderSide.none,
//       ),
//       hintStyle: textTheme.bodyLarge,
//       labelStyle: textTheme.bodyLarge!.copyWith(
//         color: Colors.black38,
//         fontWeight: FontWeight.normal,
//       ),
//     ),
//     floatingActionButtonTheme: FloatingActionButtonThemeData(
//       backgroundColor: colorScheme.secondary,
//       foregroundColor: Colors.white,
//       iconSize: 24,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(60),
//       ),
//     ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         shape: buttonShape,
//         padding: buttonPadding,
//         backgroundColor: colorScheme.primary,
//         foregroundColor: colorScheme.onPrimary,
//         textStyle: buttonTextStyle,
//         elevation: 2,
//       ),
//     ),
//     outlinedButtonTheme: OutlinedButtonThemeData(
//       style: OutlinedButton.styleFrom(
//         shape: buttonShape,
//         padding: buttonPadding,
//         side: BorderSide(
//           color: colorScheme.primary,
//           width: 1,
//         ),
//         foregroundColor: colorScheme.primary,
//         textStyle: buttonTextStyle,
//         elevation: 0,
//       ),
//     ),
//     textButtonTheme: TextButtonThemeData(
//       style: TextButton.styleFrom(
//         shape: buttonShape,
//         padding: buttonPadding,
//         foregroundColor: colorScheme.primary,
//         textStyle: buttonTextStyle,
//       ),
//     ),
//   );
// }

// TextTheme _getTextTheme(ColorScheme colorScheme) {
//   const headlineColor = _darker;
//   const headlineWeight = FontWeight.w900;
//   const headlineHeight = 1.2;
//   const headlineLetterSpacing = 2.5;

//   const titleColor = _darkest;
//   const titleWeight = FontWeight.bold;
//   const titleHeight = 1.2;
//   const titleLetterSpacing = -0.96;

//   const bodyColor = _darker;
//   const bodyWeight = FontWeight.normal;
//   const bodyHeight = 1.5;
//   const bodyLetterSpacing = 0.0;

//   const labelColor = titleColor;

//   const textTheme = TextTheme(
//     // Headline
//     headlineLarge: TextStyle(
//       fontSize: 24,
//       height: headlineHeight,
//       letterSpacing: headlineLetterSpacing,
//       color: headlineColor,
//       fontWeight: headlineWeight,
//     ),
//     headlineMedium: TextStyle(
//       fontSize: 20,
//       height: headlineHeight,
//       letterSpacing: headlineLetterSpacing,
//       color: headlineColor,
//       fontWeight: headlineWeight,
//     ),
//     headlineSmall: TextStyle(
//       fontSize: 18,
//       height: headlineHeight,
//       letterSpacing: headlineLetterSpacing,
//       color: headlineColor,
//       fontWeight: headlineWeight,
//     ),

//     // Title
//     titleLarge: TextStyle(
//       fontSize: 20,
//       height: titleHeight,
//       letterSpacing: titleLetterSpacing,
//       color: titleColor,
//       fontWeight: titleWeight,
//     ),
//     titleMedium: TextStyle(
//       fontSize: 18,
//       height: titleHeight,
//       letterSpacing: titleLetterSpacing,
//       color: titleColor,
//       fontWeight: titleWeight,
//     ),
//     titleSmall: TextStyle(
//       fontSize: 14,
//       height: titleHeight,
//       letterSpacing: titleLetterSpacing,
//       color: titleColor,
//       fontWeight: titleWeight,
//     ),

//     // Body
//     bodyLarge: TextStyle(
//       fontSize: 16,
//       height: bodyHeight,
//       letterSpacing: bodyLetterSpacing,
//       color: bodyColor,
//       fontWeight: bodyWeight,
//     ),
//     bodyMedium: TextStyle(
//       fontSize: 14,
//       height: bodyHeight,
//       letterSpacing: bodyLetterSpacing,
//       color: bodyColor,
//       fontWeight: bodyWeight,
//     ),
//     bodySmall: TextStyle(
//       fontSize: 12,
//       height: bodyHeight,
//       color: bodyColor,
//       fontWeight: bodyWeight,
//     ),

//     // Label
//     labelLarge: TextStyle(
//       fontSize: 16,
//       height: bodyHeight,
//       letterSpacing: bodyLetterSpacing,
//       color: labelColor,
//       fontWeight: bodyWeight,
//     ),
//     labelMedium: TextStyle(
//       fontSize: 14,
//       height: bodyHeight,
//       letterSpacing: bodyLetterSpacing,
//       color: labelColor,
//       fontWeight: bodyWeight,
//     ),
//     labelSmall: TextStyle(
//       fontSize: 12,
//       height: bodyHeight,
//       letterSpacing: bodyLetterSpacing,
//       color: labelColor,
//       fontWeight: bodyWeight,
//     ),
//   );

//   return GoogleFonts.rubikTextTheme(textTheme);
// }
