import 'package:flutter/material.dart';
import 'package:weather_app/l10n/l10n.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    // _locale = null;
    notifyListeners();
  }
}
