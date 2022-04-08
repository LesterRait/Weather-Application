import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('ru'),
  ];

  static getLang(String code) {
    switch (code) {
      case 'ru':
        return 'Русский';
      case 'en':
      default:
        return 'English';
    }
  }
}
