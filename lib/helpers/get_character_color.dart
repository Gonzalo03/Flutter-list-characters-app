import 'package:flutter/material.dart' show Color, Colors;
import 'package:gotobun_app/theme/character_theme.dart';

Color getCharacterColor(String character) {
  switch (character) {
    case 'Miku':
      return CharacterTheme.mikuTheme;
    case 'Ichika':
      return CharacterTheme.ichikaTheme;
    case 'Nino':
      return CharacterTheme.ninoTheme;
    case 'Yotsuba':
      return CharacterTheme.yotsubaTheme;
    case 'Itsuki':
      return CharacterTheme.itsukiTheme;
    default:
      return Colors.redAccent;
  }
}
