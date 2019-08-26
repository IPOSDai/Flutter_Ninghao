import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class LocaleUtils {
  final Locale locale;

  LocaleUtils(this.locale);

  static Map<String, Map<String, String>> _localized = {
    'en': {
      'title': 'hello',
    },
    'zh': {
      'title': '您好',
    }
  };

  String get title {
    return _localized[locale.languageCode]['title'];
  }
}

class LocaleDemoDelegate extends LocalizationsDelegate<LocaleUtils> {
  LocaleDemoDelegate();

  @override
  Future<LocaleUtils> load(Locale locale) {
    // TODO: implement load
    return SynchronousFuture<LocaleUtils> (
        LocaleUtils(locale),
    );
  }

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return true;
  }

  @override
  bool shouldReload(LocalizationsDelegate<LocaleUtils> old) {
    // TODO: implement shouldReload
    return false;
  }
}