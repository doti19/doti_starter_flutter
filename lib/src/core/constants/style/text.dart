import 'package:flutter/material.dart';

class TextStyles {
  const TextStyles._();

  static TextStyle get xSmall => const TextStyle(
        fontSize: 14,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 14 / 14,
        letterSpacing: 0,
      );

  static TextStyle get medium => const TextStyle(
        fontSize: 20,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        height: 20 / 20,
        letterSpacing: 0,
      );

  static TextStyle get small => const TextStyle(
        fontSize: 14,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 14 / 14,
        letterSpacing: 0,
      );

  static TextStyle get xmedium => const TextStyle(
        fontSize: 16,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 16 / 16,
        letterSpacing: 0,
      );

  static TextStyle get miniHeader => const TextStyle(
        fontSize: 16,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        height: 16 / 16,
        letterSpacing: 0,
      );

  static TextStyle get header => const TextStyle(
        fontSize: 28,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        height: 28 / 28,
        letterSpacing: 0,
      );
}
