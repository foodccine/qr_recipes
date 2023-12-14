import 'package:flutter/material.dart';

class AppColors {
  static var primaryColor = {
    'dark': HexColor.fromHex('#2D2C30'),
    'light': HexColor.fromHex('#F9F9F9'),
  };
  static var primaryDarkColor = {
    'dark': HexColor.fromHex('#242326'),
    'light': HexColor.fromHex('#F2F2F2'),
  };
  static var accentColor = {
    'dark': HexColor.fromHex('#5451BB'),
    'light': HexColor.fromHex('#5451BB'),
  };
  static var backgroundColor = {
    'dark': HexColor.fromHex('#27252A'),
    'light': HexColor.fromHex('#FFFFFF'),
  };
  static var cardBackgroundColor = {
    'dark': HexColor.fromHex('#38363D'),
    'light': HexColor.fromHex('#F4F4F4'),
  };
  static var mainColor = {
    'dark': HexColor.fromHex('#F4F4FC'),
    'light': HexColor.fromHex('#1D1D21'),
  };
  //NotReady Yet
  static var white = {
    'dark': HexColor.fromHex('#FFFFFFFF'),
    'light': HexColor.fromHex('#FFFFFFFF'),
  };
  static var darkColor = {
    'dark': HexColor.fromHex('#232323'),
    'light': HexColor.fromHex('#232323'),
  };
  static var darkGreyColor = {
    'dark': HexColor.fromHex('#1c1c1c'),
    'light': HexColor.fromHex('#1c1c1c'),
  };
  static var darkCardColor = {
    'dark': HexColor.fromHex('#363636'),
    'light': HexColor.fromHex('#363636'),
  };
  static var blackHighlightColor = {
    'dark': HexColor.fromHex('#363636'),
    'light': HexColor.fromHex('#363636'),
  };
  static var goldAccentColor = {
    'dark': HexColor.fromHex('#FABE1D'),
    'light': HexColor.fromHex('#FABE1D'),
  };
  static var imageGradiantFirstColor = {
    'dark': HexColor.fromHex('#000000').withOpacity(0.7),
    'light': HexColor.fromHex('#000000').withOpacity(0.7),
  };
  static var imageGradiantLastColor = {
    'dark': HexColor.fromHex('#000000').withOpacity(0),
    'light': HexColor.fromHex('#000000').withOpacity(0),
  };

  static var textActionColor = {
    'dark': HexColor.fromHex('#000000').withOpacity(0),
    'light': HexColor.fromHex('#000000').withOpacity(0),
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
