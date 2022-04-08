import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/l10n/l10n.dart';
import 'package:weather_app/provider/localization.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final lang = L10n.getLang(locale.languageCode);
    return Center(
      child: Text(lang),
    );
  }
}

class SelectLanguageWidget extends StatelessWidget {
  const SelectLanguageWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalizationProvider>(context);
    final locale = provider.locale ?? Locale('ru');

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: locale,
        icon: Container(width: 12),
        items: L10n.all.map(
          (locale) {
            final flag = L10n.getLang(locale.languageCode);

            return DropdownMenuItem(
              child: Center(
                child: Text(
                  flag,
                  // style: const TextStyle(fontSize: 32),
                ),
              ),
              value: locale,
              onTap: () {
                final provider =
                    Provider.of<LocalizationProvider>(context, listen: false);

                provider.setLocale(locale);
              },
            );
          },
        ).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
