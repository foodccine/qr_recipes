import 'package:flutter/material.dart';

class AppColors {
  static var primaryColor = {
    'dark': HexColor.fromHex('#FFFFFFFF'),
    'light': HexColor.fromHex('#FFFFFFFF'),
  };
  static var primaryDarkColor = {
    'dark': HexColor.fromHex('#242326'),
    'light': HexColor.fromHex('#F2F2F2'),
  };
  static var accentColor = {
    'dark': HexColor.fromHex('#1381A6'),
    'light': HexColor.fromHex('#1381A6'),
  };
  static var secondAccentColor = {
    'dark': HexColor.fromHex('#ED6F67'),
    'light': HexColor.fromHex('#ED6F67'),
  };
  static var backgroundColor = {
    'dark': HexColor.fromHex('#EDEBEC'),
    'light': HexColor.fromHex('#EDEBEC'),
  };
  static var cardBackgroundColor = {
    'dark': HexColor.fromHex('#FFFFFF'),
    'light': HexColor.fromHex('#FFFFFF'),
  };
  static var mainColor = {
    'dark': HexColor.fromHex('#343839'),
    'light': HexColor.fromHex('#343839'),
  };
  static var white = {
    'dark': HexColor.fromHex('#FFFFFF'),
    'light': HexColor.fromHex('#FFFFFF'),
  };
  static var black = {
    'dark': HexColor.fromHex('#000000'),
    'light': HexColor.fromHex('#000000'),
  };
}

extension HexColor on Color {
  static Color fromHex(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
